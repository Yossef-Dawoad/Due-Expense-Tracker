import 'package:drift/drift.dart';

/// Mixin providing standard sync columns for all tables.
///
/// Per database_structure.md Section 4 — every table gets these columns
/// to support offline-first sync with PocketBase.
mixin SyncColumns on Table {
  /// Maps to the PocketBase record ID. Null when created offline and not yet synced.
  TextColumn get remoteId => text().nullable()();

  /// True when local changes need to be pushed to the remote server.
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();

  /// Soft deletion marker. Record is hidden from UI but kept for sync safety.
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  /// Conflict resolution counter. Incremented on each update.
  IntColumn get version => integer().withDefault(const Constant(0))();

  /// Unix timestamp (milliseconds) of last successful sync.
  IntColumn get lastSynced => integer().withDefault(const Constant(0))();
}
