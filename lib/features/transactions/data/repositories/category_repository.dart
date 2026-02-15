import 'package:expancetracker/core/common/domain/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/features/transactions/data/datasources/categories_local_source.dart';
import 'package:expancetracker/features/transactions/data/datasources/categories_remote_datasource.dart';
import 'package:expancetracker/features/transactions/data/models/category.dart';

/// Offline-first repository for transaction categories.
///
/// Implements local-first reads with background push-pull sync.
class CategoryRepository implements OfflineFirstRepository<Category> {
  CategoryRepository({
    required CategoriesLocalSource localSource,
    required CategoriesRemoteDataSource remoteSource,
  }) : _local = localSource,
       _remote = remoteSource;

  final CategoriesLocalSource _local;
  final CategoriesRemoteDataSource _remote;

  @override
  Future<Category> add(Category item) async {
    final newItem = item.copyWith(isDirty: true, version: 1);
    final saved = await _local.insert(newItem);
    _pushDirtyRecords();
    return saved;
  }

  @override
  Future<void> delete(String id) async {
    await _local.softDelete(id);
    _pushDirtyRecords();
  }

  @override
  Future<List<Category>> getAll({bool forceRefresh = false}) async {
    if (forceRefresh) await syncWithRemote();
    return _local.getAll();
  }

  /// Alias for compatibility.
  Future<List<Category>> getAllCategories() => getAll();

  /// Alias for compatibility.
  Future<Category> addNewCategory(Category category) => add(category);

  @override
  Future<Category?> getById(String id) => _local.getById(id);

  /// Alias for compatibility.
  Future<Category> getCategoryById(String id) async {
    final cat = await getById(id);
    if (cat == null) throw Exception('Category not found');
    return cat;
  }

  @override
  Future<void> update(Category item) async {
    final updated = item.copyWith(isDirty: true, version: item.version + 1);
    await _local.update(updated);
    _pushDirtyRecords();
  }

  @override
  Stream<List<Category>> watchAll() => _local.watchAll();

  @override
  Future<void> syncWithRemote() async {
    try {
      await _pushDirtyRecords();
      await _pushDeletedRecords();
      await _pullRemoteRecords();
    } catch (_) {
      // Offline
    }
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
