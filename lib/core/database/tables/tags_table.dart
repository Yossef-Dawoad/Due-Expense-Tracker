import 'package:drift/drift.dart';
import 'package:expancetracker/core/database/mixins/sync_columns.dart';

/// Drift table for storing tags locally.
///
/// Per database_structure.md — free-form labeling for transactions.
/// More flexible than categories (e.g., "vacation", "business", "tax-deductible").
class TagsTable extends Table with SyncColumns {
  /// UUID primary key, generated locally.
  TextColumn get id => text()();

  /// Owner user ID.
  TextColumn get userId => text()();

  /// Tag label (e.g., "vacation", "business").
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}
