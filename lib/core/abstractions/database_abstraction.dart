/// Core interface for any offline database provider.
///
/// By relying on this abstraction rather than a specific implementation
/// (like Drift, Hive, or Isar), the rest of the app's infrastructure
/// depends on a stable interface. The DAOs will still need to cast
/// the connection to their specific type, but the DI and application
/// lifecycle code remains decoupled from the specific database engine.
abstract interface class OfflineDatabaseAbstraction {
  /// Initializes the database connection and performs any necessary setup.
  Future<void> initialize();

  /// Closes the database connection.
  Future<void> close();

  /// Executes the given [action] within a single database transaction.
  ///
  /// If the action throws an exception, the transaction will be rolled back.
  Future<T> transaction<T>(Future<T> Function() action);

  /// Retrieves the underlying raw database client.
  ///
  /// Data sources should cast this to the expected type (e.g., AppDatabase for Drift).
  /// This allows data sources to use provider-specific features while
  /// keeping the high-level architecture agnostic.
  T getClient<T>();
}

/// A concrete implementation of [OfflineDatabaseAbstraction] for Drift.
class DriftDatabaseProvider implements OfflineDatabaseAbstraction {
  DriftDatabaseProvider(this._database);

  final dynamic _database;

  @override
  Future<void> initialize() async {
    // Drift database initializes lazily on first access.
    // Any specific migrations or initial schema population can be orchestrated here.
  }

  @override
  Future<void> close() async {
    // Assuming the underlying database has a close method
    await _database.close();
  }

  @override
  Future<T> transaction<T>(Future<T> Function() action) async {
    // Drift supports transaction block isolation
    return _database.transaction(action);
  }

  @override
  T getClient<T>() {
    if (_database is! T) {
      throw Exception(
        'Database client type mismatch. Expected $T but got ${_database.runtimeType}',
      );
    }
    return _database;
  }
}
