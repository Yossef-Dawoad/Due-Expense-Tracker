import 'package:drift/drift.dart';

import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import '../../../../core/database/app_database.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';
import 'package:expancetracker/core/abstractions/database_abstraction.dart';

/// Local data source for accounts using Drift (SQLite).
///
/// Provides CRUD, soft-delete, dirty tracking, and reactive streams.
class WalletLocalSource implements LocalDataSource<Account> {
  WalletLocalSource({OfflineDatabaseAbstraction? database})
    : _db = database?.getClient<AppDatabase>() ?? AppDatabase.instance;

  final AppDatabase _db;

  @override
  Future<Account> insert(Account item) async {
    await _db.into(_db.accountsTable).insert(_toCompanion(item));
    return item;
  }

  @override
  Future<Account> insertOrReplace(Account item) async {
    await _db
        .into(_db.accountsTable)
        .insertOnConflictUpdate(_toCompanion(item));
    return item;
  }

  @override
  Future<Account?> getById(String id) async {
    final query = _db.select(_db.accountsTable)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _toAccount(row) : null;
  }

  @override
  Future<List<Account>> getAll() async {
    final query = _db.select(_db.accountsTable)
      ..where((t) => t.isDeleted.equals(false));
    final rows = await query.get();
    return rows.map(_toAccount).toList();
  }

  @override
  Future<List<Account>> getDirtyRecords() async {
    final query = _db.select(_db.accountsTable)
      ..where((t) => t.isDirty.equals(true));
    final rows = await query.get();
    return rows.map(_toAccount).toList();
  }

  @override
  Future<List<Account>> getDeletedRecords() async {
    final query = _db.select(_db.accountsTable)
      ..where((t) => t.isDeleted.equals(true));
    final rows = await query.get();
    return rows.map(_toAccount).toList();
  }

  @override
  Future<void> update(Account item) async {
    await (_db.update(
      _db.accountsTable,
    )..where((t) => t.id.equals(item.id))).write(_toCompanion(item));
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.accountsTable)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> softDelete(String id) async {
    await (_db.update(_db.accountsTable)..where((t) => t.id.equals(id))).write(
      const AccountsTableCompanion(
        isDeleted: Value(true),
        isDirty: Value(true),
      ),
    );
  }

  @override
  Stream<List<Account>> watchAll() {
    final query = _db.select(_db.accountsTable)
      ..where((t) => t.isDeleted.equals(false));
    return query.watch().map((rows) => rows.map(_toAccount).toList());
  }

  /// Converts a Drift row to domain model.
  Account _toAccount(AccountsTableData row) {
    return Account(
      id: row.id,
      userId: row.userId,
      name: row.name,
      type: row.type,
      currency: row.currency,
      balance: row.balance,
      isArchived: row.isArchived,
      remoteId: row.remoteId,
      isDirty: row.isDirty,
      isDeleted: row.isDeleted,
      version: row.version,
      lastSynced: row.lastSynced,
    );
  }

  /// Converts domain model to Drift companion for inserts/updates.
  AccountsTableCompanion _toCompanion(Account account) {
    return AccountsTableCompanion(
      id: Value(account.id),
      userId: Value(account.userId),
      name: Value(account.name),
      type: Value(account.type),
      currency: Value(account.currency),
      balance: Value(account.balance),
      isArchived: Value(account.isArchived),
      remoteId: Value(account.remoteId),
      isDirty: Value(account.isDirty),
      isDeleted: Value(account.isDeleted),
      version: Value(account.version),
      lastSynced: Value(account.lastSynced),
    );
  }
}
