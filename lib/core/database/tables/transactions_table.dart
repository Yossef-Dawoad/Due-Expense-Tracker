import 'package:drift/drift.dart';
import 'package:expancetracker/core/database/mixins/sync_columns.dart';

/// Drift table for storing transactions locally.
///
/// Per database_structure.md — the most important entity.
/// Represents movement of money.
class TransactionsTable extends Table with SyncColumns {
  /// UUID primary key, generated locally.
  TextColumn get id => text()();

  /// Owner user ID.
  TextColumn get userId => text()();

  /// Which account the money moved from/to. Required for balance updates.
  TextColumn get accountId => text()();

  /// Category for reporting. Optional but recommended.
  TextColumn get categoryId => text().nullable()();

  /// Numeric value. Sign handled by [type]. Never store negative values.
  RealColumn get amount => real()();

  /// Transaction type: expense, income, transfer.
  TextColumn get type => text()();

  /// User description / notes.
  TextColumn get note => text().nullable()();

  /// When transaction occurred (NOT when created in the app).
  DateTimeColumn get date => dateTime()();

  /// True when transaction is not yet cleared (bank-import support).
  BoolColumn get isPending => boolean().withDefault(const Constant(false))();

  /// ID from bank or aggregator. Prevents duplicate imports.
  TextColumn get externalId => text().nullable()();

  // --- Local-only fields ---

  /// Unix timestamp of local creation moment. Used for ordering before sync.
  IntColumn get localCreatedAt => integer()();

  /// Unix timestamp of last local modification.
  IntColumn get localUpdatedAt => integer()();

  /// Links paired transfers (Account A → Expense, Account B → Income).
  TextColumn get transferGroupId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
