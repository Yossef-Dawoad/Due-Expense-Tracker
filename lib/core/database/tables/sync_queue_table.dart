import 'package:drift/drift.dart';

/// Sync queue table for storing pending operations.
///
/// Per database_structure.md Section 5 — CRITICAL for offline reliability.
/// Guarantees eventual consistency by queuing all local changes
/// for later push to PocketBase.
///
/// This table does NOT use SyncColumns — it is local-only infrastructure.
class SyncQueueTable extends Table {
  /// Auto-incrementing primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Which table changed (e.g., "accounts", "transactions").
  TextColumn get entityTable => text()();

  /// UUID of the changed record.
  TextColumn get rowId => text()();

  /// Operation type: insert, update, delete.
  TextColumn get operation => text()();

  /// JSON snapshot of the record data. Used for retries.
  TextColumn get payload => text()();

  /// Unix timestamp of when the queue entry was created.
  IntColumn get createdAt => integer()();

  /// Number of sync attempts. Prevents infinite retry loops.
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
}
