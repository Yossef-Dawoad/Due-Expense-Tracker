/// Core data source interfaces for offline-first architecture.
///
/// These interfaces define the contracts for local (SQLite/Drift)
/// and remote (PocketBase) data sources, following SOLID principles.
library;

/// Local data source contract for CRUD operations + reactive streaming.
///
/// Implementations handle local persistence (Drift/SQLite)
/// and provide reactive streams for UI updates.
/// All items support soft-delete via [isDeleted] flag.
abstract interface class LocalDataSource<T> {
  /// Inserts a new item into local storage.
  Future<T> insert(T item);

  /// Inserts or replaces an item (upsert) for sync merging.
  Future<T> insertOrReplace(T item);

  /// Retrieves an item by its unique identifier.
  Future<T?> getById(String id);

  /// Retrieves all non-deleted items from local storage.
  Future<List<T>> getAll();

  /// Retrieves all items marked as dirty (needs sync push).
  Future<List<T>> getDirtyRecords();

  /// Retrieves all items marked as soft-deleted (needs sync delete).
  Future<List<T>> getDeletedRecords();

  /// Updates an existing item.
  Future<void> update(T item);

  /// Hard-deletes an item by its unique identifier.
  /// Only called after successful remote deletion.
  Future<void> delete(String id);

  /// Marks an item as soft-deleted locally.
  /// The record is hidden from UI but retained for sync.
  Future<void> softDelete(String id);

  /// Provides a reactive stream of all non-deleted items for UI binding.
  Stream<List<T>> watchAll();
}

/// Offline-first repository contract with sync capabilities.
///
/// Repositories coordinate between local and remote data sources,
/// implementing the offline-first pattern with dirty tracking,
/// version-based conflict resolution, and sync queue.
abstract interface class OfflineFirstRepository<T> {
  /// Retrieves all items, optionally forcing a remote refresh.
  Future<List<T>> getAll({bool forceRefresh = false});

  /// Retrieves a single item by its unique identifier.
  Future<T?> getById(String id);

  /// Adds a new item (saves locally first, syncs in background).
  Future<T> add(T item);

  /// Updates an existing item (marks dirty, syncs in background).
  Future<void> update(T item);

  /// Soft-deletes an item (marks isDeleted, syncs in background).
  Future<void> delete(String id);

  /// Provides a reactive stream of all items for UI binding.
  Stream<List<T>> watchAll();

  /// Synchronizes local changes with remote server.
  ///
  /// Push-Pull strategy:
  /// 1. PUSH: Upload all dirty local records
  /// 2. PUSH: Send soft-deleted records for remote deletion
  /// 3. PULL: Fetch remote records and merge with version comparison
  Future<void> syncWithRemote();
}
