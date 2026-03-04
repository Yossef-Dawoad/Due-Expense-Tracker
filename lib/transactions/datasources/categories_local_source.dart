import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/core/abstractions/database_abstraction.dart';
import '../models/category.dart';

/// Local data source for categories using Drift (SQLite).
class CategoriesLocalSource implements LocalDataSource<CategoryModel> {
  CategoriesLocalSource({OfflineDatabaseAbstraction? database})
    : _db = database?.getClient<AppDatabase>() ?? AppDatabase.instance;

  final AppDatabase _db;

  @override
  Future<CategoryModel> insert(CategoryModel item) async {
    await _db.into(_db.categoriesTable).insert(_toCompanion(item));
    return item;
  }

  @override
  Future<CategoryModel> insertOrReplace(CategoryModel item) async {
    await _db
        .into(_db.categoriesTable)
        .insertOnConflictUpdate(_toCompanion(item));
    return item;
  }

  @override
  Future<CategoryModel?> getById(String id) async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _toCategoryModel(row) : null;
  }

  @override
  Future<List<CategoryModel>> getAll() async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDeleted.equals(false));
    final rows = await query.get();
    return rows.map(_toCategoryModel).toList();
  }

  @override
  Future<List<CategoryModel>> getDirtyRecords() async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDirty.equals(true));
    final rows = await query.get();
    return rows.map(_toCategoryModel).toList();
  }

  @override
  Future<List<CategoryModel>> getDeletedRecords() async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDeleted.equals(true));
    final rows = await query.get();
    return rows.map(_toCategoryModel).toList();
  }

  @override
  Future<void> update(CategoryModel item) async {
    await (_db.update(
      _db.categoriesTable,
    )..where((t) => t.id.equals(item.id))).write(_toCompanion(item));
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.categoriesTable)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> softDelete(String id) async {
    await (_db.update(
      _db.categoriesTable,
    )..where((t) => t.id.equals(id))).write(
      const CategoriesTableCompanion(
        isDeleted: Value(true),
        isDirty: Value(true),
      ),
    );
  }

  @override
  Stream<List<CategoryModel>> watchAll() {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDeleted.equals(false));
    return query.watch().map((rows) => rows.map(_toCategoryModel).toList());
  }

  /// Converts a Drift row to domain model.
  CategoryModel _toCategoryModel(CategoriesTableData row) {
    return CategoryModel(
      id: row.id,
      userId: row.userId,
      name: row.name,
      icon: row.icon,
      color: row.color,
      parentId: row.parentId,
      remoteId: row.remoteId,
      isDirty: row.isDirty,
      isDeleted: row.isDeleted,
      version: row.version,
      lastSynced: row.lastSynced,
    );
  }

  /// Converts domain model to Drift companion.
  CategoriesTableCompanion _toCompanion(CategoryModel item) {
    return CategoriesTableCompanion(
      id: Value(item.id),
      userId: Value(item.userId),
      name: Value(item.name),
      icon: Value(item.icon),
      color: Value(item.color),
      parentId: Value(item.parentId),
      remoteId: Value(item.remoteId),
      isDirty: Value(item.isDirty),
      isDeleted: Value(item.isDeleted),
      version: Value(item.version),
      lastSynced: Value(item.lastSynced),
    );
  }
}
