import 'package:drift/drift.dart';
import 'package:expancetracker/core/database/mixins/sync_columns.dart';

/// Drift table for storing accounts locally.
///
/// Per database_structure.md — represents wallets, bank accounts, cards.
/// Includes sync columns and local-only performance fields.
class AccountsTable extends Table with SyncColumns {
  /// UUID primary key, generated locally.
  TextColumn get id => text()();

  /// Owner user ID (maps to PocketBase users collection).
  TextColumn get userId => text()();

  /// Display name (e.g., "Chase Checking", "Cash").
  TextColumn get name => text().withLength(min: 1, max: 100)();

  /// Account type: cash, bank, card.
  TextColumn get type => text()();

  /// ISO currency code (e.g., "USD", "EGP").
  TextColumn get currency => text().withDefault(const Constant('USD'))();

  /// Cached current balance. Updated when transactions sync.
  RealColumn get balance => real().withDefault(const Constant(0.0))();

  /// Soft-hides account while preserving history.
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();

  // --- Local-only performance fields ---

  /// Cached balance for instant UI display.
  RealColumn get localBalanceCache => real().withDefault(const Constant(0.0))();

  /// Unix timestamp of last balance calculation.
  IntColumn get lastCalculated => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
