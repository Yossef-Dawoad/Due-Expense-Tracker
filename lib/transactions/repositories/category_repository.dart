import 'package:logging/logging.dart';

import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/transactions/datasources/categories_local_source.dart';
import 'package:expancetracker/transactions/datasources/categories_remote_datasource.dart';
import 'package:expancetracker/transactions/models/category.dart';

/// Offline-first repository for transaction categories.
///
/// Implements local-first reads with background push-pull sync.
/// Sync errors are logged and propagated for retry coordination.
class CategoryRepository implements OfflineFirstRepository<CategoryModel> {
  CategoryRepository({
    required CategoriesLocalSource localSource,
    required CategoriesRemoteDataSource remoteSource,
  }) : _local = localSource,
       _remote = remoteSource;

  static final _log = Logger('CategoryRepository');

  final CategoriesLocalSource _local;
  final CategoriesRemoteDataSource _remote;

  @override
  Future<CategoryModel> add(CategoryModel item) async {
    final newItem = item.copyWith(isDirty: true, version: 1);
    final saved = await _local.insert(newItem);
    _pushDirtyRecords().catchError((_) {});
    return saved;
  }

  @override
  Future<void> delete(String id) async {
    await _local.softDelete(id);
    _pushDirtyRecords().catchError((_) {});
  }

  @override
  Future<List<CategoryModel>> getAll({bool forceRefresh = false}) async {
    if (forceRefresh) await syncWithRemote();
    return _local.getAll();
  }

  /// Alias for compatibility.
  Future<List<CategoryModel>> getAllCategories() => getAll();

  /// Alias for compatibility.
  Future<CategoryModel> addNewCategory(CategoryModel category) => add(category);

  @override
  Future<CategoryModel?> getById(String id) => _local.getById(id);

  /// Alias for compatibility.
  Future<CategoryModel> getCategoryById(String id) async {
    final cat = await getById(id);
    if (cat == null) throw Exception('Category not found');
    return cat;
  }

  @override
  Future<void> update(CategoryModel item) async {
    final updated = item.copyWith(isDirty: true, version: item.version + 1);
    await _local.update(updated);
    _pushDirtyRecords().catchError((_) {});
  }

  @override
  Stream<List<CategoryModel>> watchAll() => _local.watchAll();

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
        _log.warning('Failed to push category ${item.id}', e);
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
        _log.warning('Failed to push deleted category ${item.id}', e);
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
