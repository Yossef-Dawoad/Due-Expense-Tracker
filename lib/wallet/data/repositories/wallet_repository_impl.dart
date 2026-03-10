import 'dart:async';

import 'package:expancetracker/core/common/sync/repository_sync_executor.dart';
import 'package:logging/logging.dart';

import 'package:expancetracker/core/services/connectivity_service.dart';

import '../models/account.dart';
import 'wallet_repository.dart';
import '../datasources/wallet_local_source.dart';
import '../datasources/wallet_remote_source.dart';

/// Offline-first repository implementation for wallet accounts.
///
/// Sync errors are logged and propagated to the [SyncOrchestrationService]
/// for retry coordination.
class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl({
    required WalletLocalSource localSource,
    required WalletRemoteSource remoteSource,
    required ConnectivityService connectivityService,
  }) : _local = localSource,
       _remote = remoteSource,
       _syncExecutor = RepositorySyncExecutor(
         connectivityService: connectivityService,
         logger: _log,
         repositoryName: 'WalletRepositoryImpl',
       );

  static final _log = Logger('WalletRepositoryImpl');

  final WalletLocalSource _local;
  final WalletRemoteSource _remote;
  final RepositorySyncExecutor _syncExecutor;

  @override
  Future<List<Account>> getAll({bool forceRefresh = false}) async {
    if (forceRefresh) await syncWithRemote();
    return _local.getAll();
  }

  @override
  Future<Account?> getById(String id) => _local.getById(id);

  @override
  Stream<List<Account>> watchAll() => _local.watchAll();

  @override
  Future<Account> add(Account item) async {
    final newItem = item.copyWith(isDirty: true, version: 1);
    final saved = await _local.insert(newItem);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
    return saved;
  }

  @override
  Future<void> update(Account item) async {
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

  /// PUSH: Upload all dirty local records.
  Future<void> _pushDirtyRecords(List<String> failures) async {
    await _syncExecutor.pushDirtyItems<Account>(
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
      entityName: 'account',
    );
  }

  /// PUSH: Send soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords(List<String> failures) async {
    await _syncExecutor.pushDeletedItems<Account>(
      failures: failures,
      getDeletedRecords: _local.getDeletedRecords,
      itemId: (item) => item.id,
      remoteId: (item) => item.remoteId,
      deleteRemoteItem: _remote.deleteItem,
      deleteLocalItem: _local.delete,
      entityName: 'account',
    );
  }

  /// PULL: Fetch remote records and merge with version comparison.
  Future<void> _pullRemoteRecords(List<String> failures) async {
    await _syncExecutor.pullRemoteItems<Account>(
      failures: failures,
      getAllRemoteItems: _remote.getAllItems,
      itemId: (item) => item.id,
      getLocalById: _local.getById,
      isDirty: (item) => item.isDirty,
      mergeRemoteForLocal:
          ({required remote, required local, required syncedAt}) =>
              remote.copyWith(id: local.id, lastSynced: syncedAt),
      upsertLocalItem: _local.insertOrReplace,
      entityName: 'accounts',
    );
  }
}
