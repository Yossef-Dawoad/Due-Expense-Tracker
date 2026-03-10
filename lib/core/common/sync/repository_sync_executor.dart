import 'package:expancetracker/core/common/exceptions/repository_sync_exception.dart';
import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:logging/logging.dart';

class RepositorySyncExecutor {
  RepositorySyncExecutor({
    required ConnectivityService connectivityService,
    required Logger logger,
    required String repositoryName,
  }) : _connectivity = connectivityService,
       _log = logger,
       _repositoryName = repositoryName;

  final ConnectivityService _connectivity;
  final Logger _log;
  final String _repositoryName;

  Future<void> executeSync({
    required Future<void> Function(List<String> failures) pushDirtyRecords,
    required Future<void> Function(List<String> failures) pushDeletedRecords,
    required Future<void> Function(List<String> failures) pullRemoteRecords,
  }) async {
    final online = await isOnline();
    if (!online) {
      _log.fine('Skipping $_repositoryName sync: offline');
      return;
    }

    final failures = <String>[];
    await pushDirtyRecords(failures);
    await pushDeletedRecords(failures);
    await pullRemoteRecords(failures);

    if (failures.isNotEmpty) {
      throw RepositorySyncException(
        repository: _repositoryName,
        failures: failures,
      );
    }
  }

  Future<void> executeBackgroundSync(Future<void> Function() syncAction) async {
    final online = await isOnline();
    if (!online) {
      return;
    }

    try {
      await syncAction();
    } catch (e, st) {
      _log.warning('Background $_repositoryName sync failed', e, st);
    }
  }

  Future<bool> isOnline() async {
    if (_connectivity.isConnected.value) {
      return true;
    }

    try {
      return await _connectivity.checkConnectivity();
    } catch (e, st) {
      _log.warning(
        'Connectivity check failed before $_repositoryName sync',
        e,
        st,
      );
      return false;
    }
  }

  Future<void> pushDirtyItems<T>({
    required List<String> failures,
    required Future<List<T>> Function() getDirtyRecords,
    required bool Function(T item) isDeleted,
    required String Function(T item) itemId,
    required String? Function(T item) remoteId,
    required Future<T> Function(T item) addRemoteItem,
    required Future<T> Function(T item) updateRemoteItem,
    required T Function(T item, int syncedAt) markAsSynced,
    required Future<void> Function(T item) updateLocalItem,
    required String entityName,
  }) async {
    final dirtyItems = await getDirtyRecords();
    for (final item in dirtyItems) {
      if (isDeleted(item)) {
        continue;
      }

      final id = itemId(item);
      try {
        final synced = remoteId(item) != null
            ? await updateRemoteItem(item)
            : await addRemoteItem(item);
        final syncedAt = DateTime.now().millisecondsSinceEpoch;
        await updateLocalItem(markAsSynced(synced, syncedAt));
      } catch (e, st) {
        failures.add('push:$id:$e');
        _log.warning('Failed to push $entityName $id', e, st);
      }
    }
  }

  Future<void> pushDeletedItems<T>({
    required List<String> failures,
    required Future<List<T>> Function() getDeletedRecords,
    required String Function(T item) itemId,
    required String? Function(T item) remoteId,
    required Future<void> Function(T item) deleteRemoteItem,
    required Future<void> Function(String id) deleteLocalItem,
    required String entityName,
  }) async {
    final deletedItems = await getDeletedRecords();
    for (final item in deletedItems) {
      final id = itemId(item);
      try {
        if (remoteId(item) != null) {
          await deleteRemoteItem(item);
        }
        await deleteLocalItem(id);
      } catch (e, st) {
        failures.add('delete:$id:$e');
        _log.warning('Failed to push deleted $entityName $id', e, st);
      }
    }
  }

  Future<void> pullRemoteItems<T>({
    required List<String> failures,
    required Future<List<T>> Function() getAllRemoteItems,
    required String Function(T item) itemId,
    required Future<T?> Function(String id) getLocalById,
    required bool Function(T item) isDirty,
    required T Function({
      required T remote,
      required T local,
      required int syncedAt,
    })
    mergeRemoteForLocal,
    required Future<void> Function(T item) upsertLocalItem,
    required String entityName,
  }) async {
    late final List<T> remoteItems;
    try {
      remoteItems = await getAllRemoteItems();
    } catch (e, st) {
      failures.add('pull:list:$e');
      _log.warning('Failed to pull $entityName list from remote', e, st);
      return;
    }

    for (final remote in remoteItems) {
      final id = itemId(remote);
      try {
        final local = await getLocalById(id);
        if (local == null) {
          await upsertLocalItem(remote);
          continue;
        }

        if (!isDirty(local)) {
          final syncedAt = DateTime.now().millisecondsSinceEpoch;
          await upsertLocalItem(
            mergeRemoteForLocal(
              remote: remote,
              local: local,
              syncedAt: syncedAt,
            ),
          );
        }
      } catch (e, st) {
        failures.add('pull:item:$id:$e');
        _log.warning('Failed to merge remote $entityName $id', e, st);
      }
    }
  }
}
