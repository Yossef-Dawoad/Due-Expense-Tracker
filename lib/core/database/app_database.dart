import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/accounts_table.dart';
import 'tables/categories_table.dart';
import 'tables/sync_queue_table.dart';
import 'tables/tags_table.dart';
import 'tables/transaction_tags_table.dart';
import 'tables/transactions_table.dart';

part 'app_database.g.dart';

/// Central Drift database for local persistence.
///
/// Supports offline-first architecture by storing all data locally
/// with sync tracking fields. Fresh start — schema version 1.
@DriftDatabase(
  tables: [
    AccountsTable,
    CategoriesTable,
    TransactionsTable,
    TagsTable,
    TransactionTagsTable,
    SyncQueueTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Testing constructor for in-memory database.
  AppDatabase.forTesting(super.e);

  /// Singleton instance for easy access.
  static AppDatabase? _instance;
  static AppDatabase get instance => _instance ??= AppDatabase();

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // comprehensive reset logic: ensure new schema is applied
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      },
    );
  }

  /// Opens the database connection using drift_flutter.
  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'expense_tracker_v2');
  }
}
