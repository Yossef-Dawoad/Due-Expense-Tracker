import 'dart:async';

import 'package:expancetracker/core/common/sync/repository_sync_executor.dart';
import 'package:logging/logging.dart';

import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/transactions/datasources/local/categories_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/categories_remote_datasource.dart';
import 'package:expancetracker/transactions/models/category.dart';

/// Offline-first repository for transaction categories.
///
/// Implements local-first reads with background push-pull sync.
/// Sync errors are logged and propagated for retry coordination.
class CategoryRepository implements OfflineFirstRepository<CategoryModel> {
  CategoryRepository({
    required CategoriesLocalSource localSource,
    required CategoriesRemoteDataSource remoteSource,
    required ConnectivityService connectivityService,
  }) : _local = localSource,
       _remote = remoteSource,
       _syncExecutor = RepositorySyncExecutor(
         connectivityService: connectivityService,
         logger: _log,
         repositoryName: 'CategoryRepository',
       );

  static final _log = Logger('CategoryRepository');

  final CategoriesLocalSource _local;
  final CategoriesRemoteDataSource _remote;
  final RepositorySyncExecutor _syncExecutor;

  @override
  Future<CategoryModel> add(CategoryModel item) async {
    final newItem = item.copyWith(isDirty: true, version: 1);
    final saved = await _local.insert(newItem);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
    return saved;
  }

  @override
  Future<void> delete(String id) async {
    await _local.softDelete(id);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
  }

  @override
  Future<List<CategoryModel>> getAll({bool forceRefresh = false}) async {
    if (forceRefresh) await syncWithRemote();
    return _local.getAll();
  }

  @override
  Future<CategoryModel?> getById(String id) => _local.getById(id);

  @override
  Future<void> update(CategoryModel item) async {
    final updated = item.copyWith(isDirty: true, version: item.version + 1);
    await _local.update(updated);
    unawaited(_syncExecutor.executeBackgroundSync(syncWithRemote));
  }

  @override
  Stream<List<CategoryModel>> watchAll() => _local.watchAll();

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
    await _syncExecutor.pushDirtyItems<CategoryModel>(
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
      entityName: 'category',
    );
  }

  /// PUSH soft-deleted records for remote deletion.
  Future<void> _pushDeletedRecords(List<String> failures) async {
    await _syncExecutor.pushDeletedItems<CategoryModel>(
      failures: failures,
      getDeletedRecords: _local.getDeletedRecords,
      itemId: (item) => item.id,
      remoteId: (item) => item.remoteId,
      deleteRemoteItem: _remote.deleteItem,
      deleteLocalItem: _local.delete,
      entityName: 'category',
    );
  }

  /// PULL remote records and merge.
  Future<void> _pullRemoteRecords(List<String> failures) async {
    await _syncExecutor.pullRemoteItems<CategoryModel>(
      failures: failures,
      getAllRemoteItems: _remote.getAllItems,
      itemId: (item) => item.id,
      getLocalById: _local.getById,
      isDirty: (item) => item.isDirty,
      mergeRemoteForLocal:
          ({required remote, required local, required syncedAt}) =>
              remote.copyWith(id: local.id, lastSynced: syncedAt),
      upsertLocalItem: _local.insertOrReplace,
      entityName: 'categories',
    );
  }
}
