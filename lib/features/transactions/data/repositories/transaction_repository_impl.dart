import 'dart:async';

import '../models/transaction.dart';
import '../datasources/transaction_local_source.dart';
import '../datasources/transaction_remote_source.dart';
import 'transaction_repository.dart';

/// Offline-first repository implementation for transactions.
///
/// Implements local-first reads with background push-pull sync.
class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl({
    required TransactionLocalSource localSource,
    required TransactionRemoteSource remoteSource,
  }) : _local = localSource,
       _remote = remoteSource;

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
    _pushDirtyRecords();
    return saved;
  }

  @override
  Future<void> update(Transaction item) async {
    final updated = item.copyWith(isDirty: true, version: item.version + 1);
    await _local.update(updated);
    _pushDirtyRecords();
  }

  @override
  Future<void> delete(String id) async {
    await _local.softDelete(id);
    _pushDirtyRecords();
  }

  @override
  Future<void> syncWithRemote() async {
    try {
      await _pushDirtyRecords();
      await _pushDeletedRecords();
      await _pullRemoteRecords();
    } catch (_) {}
  }

  /// PUSH dirty records to remote.
  Future<void> _pushDirtyRecords() async {
    try {
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
        } catch (_) {}
      }
    } catch (_) {}
  }

  /// PUSH soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords() async {
    try {
      final deleted = await _local.getDeletedRecords();
      for (final item in deleted) {
        try {
          if (item.remoteId != null) {
            await _remote.deleteItem(item);
          }
          await _local.delete(item.id);
        } catch (_) {}
      }
    } catch (_) {}
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
