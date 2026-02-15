/// Represents an entry in the sync queue for offline reliability.
///
/// Per database_structure.md — guarantees eventual consistency
/// by queuing all local changes for later push to PocketBase.
class SyncQueueEntry {
  const SyncQueueEntry({
    this.id,
    required this.tableName,
    required this.rowId,
    required this.operation,
    required this.payload,
    required this.createdAt,
    this.retryCount = 0,
  });

  /// Auto-incremented ID (null for new entries).
  final int? id;

  /// Which table changed (e.g., "accounts", "transactions").
  final String tableName;

  /// UUID of the changed record.
  final String rowId;

  /// Operation type: insert, update, delete.
  final String operation;

  /// JSON snapshot of the record data.
  final String payload;

  /// Unix timestamp of when the entry was created.
  final int createdAt;

  /// Number of sync attempts.
  final int retryCount;
}
