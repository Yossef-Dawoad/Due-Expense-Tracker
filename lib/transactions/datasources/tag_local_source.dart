import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/transactions/models/tag.dart';
import 'package:expancetracker/core/abstractions/database_abstraction.dart';

/// Local data source for tags using Drift (SQLite).
class TagLocalSource implements LocalDataSource<Tag> {
  TagLocalSource({OfflineDatabaseAbstraction? database})
    : _db = database?.getClient<AppDatabase>() ?? AppDatabase.instance;

  final AppDatabase _db;

  @override
  Future<Tag> insert(Tag item) async {
    await _db.into(_db.tagsTable).insert(_toCompanion(item));
    return item;
  }

  @override
  Future<Tag> insertOrReplace(Tag item) async {
    await _db.into(_db.tagsTable).insertOnConflictUpdate(_toCompanion(item));
    return item;
  }

  @override
  Future<Tag?> getById(String id) async {
    final query = _db.select(_db.tagsTable)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _toTag(row) : null;
  }

  @override
  Future<List<Tag>> getAll() async {
    final query = _db.select(_db.tagsTable)
      ..where((t) => t.isDeleted.equals(false));
    final rows = await query.get();
    return rows.map(_toTag).toList();
  }

  @override
  Future<List<Tag>> getDirtyRecords() async {
    final query = _db.select(_db.tagsTable)
      ..where((t) => t.isDirty.equals(true));
    final rows = await query.get();
    return rows.map(_toTag).toList();
  }

  @override
  Future<List<Tag>> getDeletedRecords() async {
    final query = _db.select(_db.tagsTable)
      ..where((t) => t.isDeleted.equals(true));
    final rows = await query.get();
    return rows.map(_toTag).toList();
  }

  @override
  Future<void> update(Tag item) async {
    await (_db.update(
      _db.tagsTable,
    )..where((t) => t.id.equals(item.id))).write(_toCompanion(item));
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.tagsTable)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> softDelete(String id) async {
    await (_db.update(_db.tagsTable)..where((t) => t.id.equals(id))).write(
      const TagsTableCompanion(isDeleted: Value(true), isDirty: Value(true)),
    );
  }

  @override
  Stream<List<Tag>> watchAll() {
    final query = _db.select(_db.tagsTable)
      ..where((t) => t.isDeleted.equals(false));
    return query.watch().map((rows) => rows.map(_toTag).toList());
  }

  /// Converts a Drift row to domain model.
  Tag _toTag(TagsTableData row) {
    return Tag(
      id: row.id,
      userId: row.userId,
      name: row.name,
      remoteId: row.remoteId,
      isDirty: row.isDirty,
      isDeleted: row.isDeleted,
      version: row.version,
      lastSynced: row.lastSynced,
    );
  }

  /// Converts domain model to Drift companion.
  TagsTableCompanion _toCompanion(Tag item) {
    return TagsTableCompanion(
      id: Value(item.id),
      userId: Value(item.userId),
      name: Value(item.name),
      remoteId: Value(item.remoteId),
      isDirty: Value(item.isDirty),
      isDeleted: Value(item.isDeleted),
      version: Value(item.version),
      lastSynced: Value(item.lastSynced),
    );
  }
}
