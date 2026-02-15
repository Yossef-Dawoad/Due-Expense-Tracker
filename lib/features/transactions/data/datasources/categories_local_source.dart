import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/domain/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/core/database/app_database.dart';
import '../models/category.dart';

/// Local data source for categories using Drift (SQLite).
class CategoriesLocalSource implements LocalDataSource<Category> {
  CategoriesLocalSource({AppDatabase? database})
    : _db = database ?? AppDatabase.instance;

  final AppDatabase _db;

  @override
  Future<Category> insert(Category item) async {
    await _db.into(_db.categoriesTable).insert(_toCompanion(item));
    return item;
  }

  @override
  Future<Category> insertOrReplace(Category item) async {
    await _db
        .into(_db.categoriesTable)
        .insertOnConflictUpdate(_toCompanion(item));
    return item;
  }

  @override
  Future<Category?> getById(String id) async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _toCategory(row) : null;
  }

  @override
  Future<List<Category>> getAll() async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDeleted.equals(false));
    final rows = await query.get();
    return rows.map(_toCategory).toList();
  }

  @override
  Future<List<Category>> getDirtyRecords() async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDirty.equals(true));
    final rows = await query.get();
    return rows.map(_toCategory).toList();
  }

  @override
  Future<List<Category>> getDeletedRecords() async {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDeleted.equals(true));
    final rows = await query.get();
    return rows.map(_toCategory).toList();
  }

  @override
  Future<void> update(Category item) async {
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
  Stream<List<Category>> watchAll() {
    final query = _db.select(_db.categoriesTable)
      ..where((t) => t.isDeleted.equals(false));
    return query.watch().map((rows) => rows.map(_toCategory).toList());
  }

  /// Converts a Drift row to domain model.
  Category _toCategory(CategoriesTableData row) {
    return Category(
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
  CategoriesTableCompanion _toCompanion(Category item) {
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
