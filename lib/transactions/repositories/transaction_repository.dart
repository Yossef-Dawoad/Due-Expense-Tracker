import 'dart:async';

import 'package:logging/logging.dart';

import '../../core/common/intrefaces/datasource_interfaces.dart';
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
  }) : _local = localSource,
       _remote = remoteSource;

  static final _log = Logger('TransactionRepositoryImpl');

  final TransactionLocalSource _local;
  final TransactionRemoteSource _remote;

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
    // Optimistic push — errors are handled by the sync orchestrator.
    _pushDirtyRecords().catchError((_) {});
    return saved;
  }

  @override
  Future<void> update(Transaction item) async {
    final updated = item.copyWith(isDirty: true, version: item.version + 1);
    await _local.update(updated);
    _pushDirtyRecords().catchError((_) {});
  }

  @override
  Future<void> delete(String id) async {
    await _local.softDelete(id);
    _pushDirtyRecords().catchError((_) {});
  }

  @override
  Future<void> syncWithRemote() async {
    await _pushDirtyRecords();
    await _pushDeletedRecords();
    await _pullRemoteRecords();
  }

  @override
  Future<int> getDirtyCount() async {
    final dirty = await _local.getDirtyRecords();
    final deleted = await _local.getDeletedRecords();
    return dirty.length + deleted.length;
  }

  /// PUSH dirty records to remote.
  Future<void> _pushDirtyRecords() async {
    final dirtyItems = await _local.getDirtyRecords();
    for (final item in dirtyItems) {
      try {
        if (item.remoteId != null) {
          final synced = await _remote.updateItem(item);
          await _local.update(
            synced.copyWith(
              isDirty: false,
              lastSynced: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        } else {
          final synced = await _remote.addNewItem(item);
          await _local.update(
            synced.copyWith(
              isDirty: false,
              lastSynced: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }
      } catch (e) {
        _log.warning('Failed to push transaction ${item.id}', e);
        // Continue with remaining items — the record stays dirty for retry.
      }
    }
  }

  /// PUSH soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords() async {
    final deleted = await _local.getDeletedRecords();
    for (final item in deleted) {
      try {
        if (item.remoteId != null) {
          await _remote.deleteItem(item);
        }
        await _local.delete(item.id);
      } catch (e) {
        _log.warning('Failed to push deleted transaction ${item.id}', e);
      }
    }
  }

  /// PULL remote records and merge.
  Future<void> _pullRemoteRecords() async {
    final remoteItems = await _remote.getAllItems();
    for (final remote in remoteItems) {
      final local = await _local.getById(remote.id);
      if (local == null) {
        await _local.insertOrReplace(remote);
      } else if (!local.isDirty) {
        await _local.insertOrReplace(
          remote.copyWith(
            id: local.id,
            lastSynced: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      }
    }
  }
}
