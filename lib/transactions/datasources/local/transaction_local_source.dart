import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:expancetracker/core/abstractions/database_abstraction.dart';

/// Local data source for transactions using Drift (SQLite).
///
/// Unlike the old implementation, this no longer JOINs with categories.
/// Transactions store [categoryId] as a flat string reference.
/// Category data is resolved at the ViewModel/UI layer when needed.
class TransactionLocalSource implements LocalDataSource<Transaction> {
  TransactionLocalSource({OfflineDatabaseAbstraction? database})
    : _db = database?.getClient<AppDatabase>() ?? AppDatabase.instance;

  final AppDatabase _db;

  @override
  Future<Transaction> insert(Transaction item) async {
    await _db.into(_db.transactionsTable).insert(_toCompanion(item));
    return item;
  }

  @override
  Future<Transaction> insertOrReplace(Transaction item) async {
    await _db
        .into(_db.transactionsTable)
        .insertOnConflictUpdate(_toCompanion(item));
    return item;
  }

  @override
  Future<Transaction?> getById(String id) async {
    final query = _db.select(_db.transactionsTable)
      ..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _toTransaction(row) : null;
  }

  @override
  Future<List<Transaction>> getAll() async {
    final query = _db.select(_db.transactionsTable)
      ..where((t) => t.isDeleted.equals(false));
    final rows = await query.get();
    return rows.map(_toTransaction).toList();
  }

  @override
  Future<List<Transaction>> getDirtyRecords() async {
    final query = _db.select(_db.transactionsTable)
      ..where((t) => t.isDirty.equals(true));
    final rows = await query.get();
    return rows.map(_toTransaction).toList();
  }

  @override
  Future<List<Transaction>> getDeletedRecords() async {
    final query = _db.select(_db.transactionsTable)
      ..where((t) => t.isDeleted.equals(true));
    final rows = await query.get();
    return rows.map(_toTransaction).toList();
  }

  @override
  Future<void> update(Transaction item) async {
    await (_db.update(
      _db.transactionsTable,
    )..where((t) => t.id.equals(item.id))).write(_toCompanion(item));
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(
      _db.transactionsTable,
    )..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> softDelete(String id) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (_db.update(
      _db.transactionsTable,
    )..where((t) => t.id.equals(id))).write(
      TransactionsTableCompanion(
        isDeleted: const Value(true),
        isDirty: const Value(true),
        localUpdatedAt: Value(now),
      ),
    );
  }

  @override
  Stream<List<Transaction>> watchAll() {
    final query = _db.select(_db.transactionsTable)
      ..where((t) => t.isDeleted.equals(false));
    return query.watch().map((rows) => rows.map(_toTransaction).toList());
  }

  /// Converts a Drift row to domain model.
  Transaction _toTransaction(TransactionsTableData row) {
    return Transaction(
      id: row.id,
      userId: row.userId,
      accountId: row.accountId,
      categoryId: row.categoryId,
      amount: row.amount,
      type: TransactionType.fromString(row.type),
      note: row.note,
      date: row.date,
      isPending: row.isPending,
      externalId: row.externalId,
      transferGroupId: row.transferGroupId,
      remoteId: row.remoteId,
      isDirty: row.isDirty,
      isDeleted: row.isDeleted,
      version: row.version,
      lastSynced: row.lastSynced,
    );
  }

  /// Converts domain model to Drift companion.
  TransactionsTableCompanion _toCompanion(Transaction item) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return TransactionsTableCompanion(
      id: Value(item.id),
      userId: Value(item.userId),
      accountId: Value(item.accountId),
      categoryId: Value(item.categoryId),
      amount: Value(item.amount),
      type: Value(item.type.name),
      note: Value(item.note),
      date: Value(item.date),
      isPending: Value(item.isPending),
      externalId: Value(item.externalId),
      localCreatedAt: Value(now),
      localUpdatedAt: Value(now),
      transferGroupId: Value(item.transferGroupId),
      remoteId: Value(item.remoteId),
      isDirty: Value(item.isDirty),
      isDeleted: Value(item.isDeleted),
      version: Value(item.version),
      lastSynced: Value(item.lastSynced),
    );
  }
}
