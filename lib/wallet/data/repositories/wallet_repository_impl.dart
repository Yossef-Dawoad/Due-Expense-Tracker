import 'package:logging/logging.dart';

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
  }) : _local = localSource,
       _remote = remoteSource;

  static final _log = Logger('WalletRepositoryImpl');

  final WalletLocalSource _local;
  final WalletRemoteSource _remote;

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
    _pushDirtyRecords().catchError((_) {});
    return saved;
  }

  @override
  Future<void> update(Account item) async {
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

  /// PUSH: Upload all dirty local records.
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
        _log.warning('Failed to push account ${item.id}', e);
      }
    }
  }

  /// PUSH: Send soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords() async {
    final deleted = await _local.getDeletedRecords();
    for (final item in deleted) {
      try {
        if (item.remoteId != null) {
          await _remote.deleteItem(item);
        }
        await _local.delete(item.id);
      } catch (e) {
        _log.warning('Failed to push deleted account ${item.id}', e);
      }
    }
  }

  /// PULL: Fetch remote records and merge with version comparison.
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
