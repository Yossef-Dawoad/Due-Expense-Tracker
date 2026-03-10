import 'dart:async';

import 'package:logging/logging.dart';

import '../../core/common/intrefaces/datasource_interfaces.dart';
import '../../core/common/sync/repository_sync_executor.dart';
import '../../core/services/connectivity_service.dart';
import '../models/transaction.dart';
import '../datasources/local/transaction_local_source.dart';
import '../datasources/remote/transaction_remote_source.dart';

/// Offline-first repository implementation for transactions.
///
/// Implements local-first reads with background push-pull sync.
/// Sync errors are logged and propagated to the [SyncOrchestrationService]
/// for retry coordination.
class TransactionRepository implements OfflineFirstRepository<Transaction> {
  TransactionRepository({
    required TransactionLocalSource localSource,
    required TransactionRemoteSource remoteSource,
    required ConnectivityService connectivityService,
  }) : _local = localSource,
       _remote = remoteSource,
       _syncExecutor = RepositorySyncExecutor(
         connectivityService: connectivityService,
         logger: _log,
         repositoryName: 'TransactionRepository',
       );

  static final _log = Logger('TransactionRepositoryImpl');

  final TransactionLocalSource _local;
  final TransactionRemoteSource _remote;
  final RepositorySyncExecutor _syncExecutor;

  @override
  Future<List<Transaction>> getAll({bool forceRefresh = false}) async {
    if (forceRefresh) await syncWithRemote();
    return _local.getAll();
  }

  @override
  Stream<List<Transaction>> watchAll() => _local.watchAll();

  @override
  Future<Transaction?> getById(String id) => _local.getById(id);

  @override
  Future<Transaction> add(Transaction item) async {
    final newItem = item.copyWith(isDirty: true, version: 1);
    final saved = await _local.insert(newItem);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
    return saved;
  }

  @override
  Future<void> update(Transaction item) async {
    final updated = item.copyWith(isDirty: true, version: item.version + 1);
    await _local.update(updated);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
  }

  @override
  Future<void> delete(String id) async {
    await _local.softDelete(id);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
  }

  @override
  Future<void> syncWithRemote() async {
    await _syncExecutor.executeSync(
      pushDirtyRecords: _pushDirtyRecords,
      pushDeletedRecords: _pushDeletedRecords,
      pullRemoteRecords: _pullRemoteRecords,
    );
  }

  @override
  Future<int> getDirtyCount() async {
    final dirty = await _local.getDirtyRecords();
    final deleted = await _local.getDeletedRecords();
    return dirty.length + deleted.length;
  }

  /// PUSH dirty records to remote.
  Future<void> _pushDirtyRecords(List<String> failures) async {
    await _syncExecutor.pushDirtyItems<Transaction>(
      failures: failures,
      getDirtyRecords: _local.getDirtyRecords,
      isDeleted: (item) => item.isDeleted,
      itemId: (item) => item.id,
      remoteId: (item) => item.remoteId,
      addRemoteItem: _remote.addNewItem,
      updateRemoteItem: _remote.updateItem,
      markAsSynced: (item, syncedAt) =>
          item.copyWith(isDirty: false, lastSynced: syncedAt),
      updateLocalItem: _local.update,
      entityName: 'transaction',
    );
  }

  /// PUSH soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords(List<String> failures) async {
    await _syncExecutor.pushDeletedItems<Transaction>(
      failures: failures,
      getDeletedRecords: _local.getDeletedRecords,
      itemId: (item) => item.id,
      remoteId: (item) => item.remoteId,
      deleteRemoteItem: _remote.deleteItem,
      deleteLocalItem: _local.delete,
      entityName: 'transaction',
    );
  }

  /// PULL remote records and merge.
  Future<void> _pullRemoteRecords(List<String> failures) async {
    await _syncExecutor.pullRemoteItems<Transaction>(
      failures: failures,
      getAllRemoteItems: _remote.getAllItems,
      itemId: (item) => item.id,
      getLocalById: _local.getById,
      isDirty: (item) => item.isDirty,
      mergeRemoteForLocal:
          ({required remote, required local, required syncedAt}) =>
              remote.copyWith(id: local.id, lastSynced: syncedAt),
      upsertLocalItem: _local.insertOrReplace,
      entityName: 'transactions',
    );
  }
}
