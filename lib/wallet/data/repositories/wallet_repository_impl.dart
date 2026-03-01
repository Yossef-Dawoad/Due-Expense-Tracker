import '../models/account.dart';
import 'wallet_repository.dart';
import '../datasources/wallet_local_source.dart';
import '../datasources/wallet_remote_source.dart';

/// Offline-first repository implementation for wallet accounts.
class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl({
    required WalletLocalSource localSource,
    required WalletRemoteSource remoteSource,
  }) : _local = localSource,
       _remote = remoteSource;

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
    _pushDirtyRecords(); // Fire-and-forget
    return saved;
  }

  @override
  Future<void> update(Account item) async {
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
    } catch (_) {
      // Offline — will retry on next sync
    }
  }

  /// PUSH: Upload all dirty local records.
  Future<void> _pushDirtyRecords() async {
    try {
      final dirtyItems = await _local.getDirtyRecords();
      for (final item in dirtyItems) {
        try {
          if (item.remoteId != null) {
            // Existing remote record — update
            final synced = await _remote.updateItem(item);
            await _local.update(
              synced.copyWith(
                isDirty: false,
                lastSynced: DateTime.now().millisecondsSinceEpoch,
              ),
            );
          } else {
            // New record — create
            final synced = await _remote.addNewItem(item);
            await _local.update(
              synced.copyWith(
                isDirty: false,
                lastSynced: DateTime.now().millisecondsSinceEpoch,
              ),
            );
          }
        } catch (_) {
          // Individual item failed — continue with others
        }
      }
    } catch (_) {}
  }

  /// PUSH: Send soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords() async {
    try {
      final deleted = await _local.getDeletedRecords();
      for (final item in deleted) {
        try {
          if (item.remoteId != null) {
            await _remote.deleteItem(item);
          }
          // Hard delete after successful remote deletion
          await _local.delete(item.id);
        } catch (_) {
          // Individual item failed — keep for retry
        }
      }
    } catch (_) {}
  }

  /// PULL: Fetch remote records and merge with version comparison.
  Future<void> _pullRemoteRecords() async {
    final remoteItems = await _remote.getAllItems();
    for (final remote in remoteItems) {
      // Find local by remoteId
      final local = await _local.getById(remote.id);
      if (local == null) {
        // New remote record — insert locally
        await _local.insertOrReplace(remote);
      } else if (!local.isDirty) {
        // No local changes — safe to overwrite
        await _local.insertOrReplace(
          remote.copyWith(
            id: local.id,
            lastSynced: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      }
      // If local is dirty, skip — local changes will be pushed next sync
    }
  }
}
