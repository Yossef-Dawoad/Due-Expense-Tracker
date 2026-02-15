import 'package:drift/drift.dart';
import 'package:expancetracker/core/database/mixins/sync_columns.dart';

/// Drift table for storing categories locally.
///
/// Per database_structure.md — groups transactions logically.
/// Categories are analytical only. They DO NOT store money state.
/// Supports hierarchical categories via [parentId].
class CategoriesTable extends Table with SyncColumns {
  /// UUID primary key, generated locally.
  TextColumn get id => text()();

  /// Owner user ID.
  TextColumn get userId => text()();

  /// Display label (e.g., "Food", "Transport", "Salary").
  TextColumn get name => text().withLength(min: 1, max: 50)();

  /// UI icon identifier as text (e.g., "restaurant", "directions_car").
  TextColumn get icon => text()();

  /// Color as hex string (e.g., "#4CAF50").
  TextColumn get color => text()();

  /// Optional parent category ID for hierarchy support.
  ///
  /// Example: Food > Groceries, Food > Restaurants.
  TextColumn get parentId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
