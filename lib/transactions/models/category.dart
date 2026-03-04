import 'package:dart_mappable/dart_mappable.dart';

part 'category.mapper.dart';

/// Represents a transaction category for grouping and reporting.
///
/// Per database_refrence.md — categories are analytical only.
/// They DO NOT store money state. Category totals are computed via queries.
/// Supports hierarchy via [parentId].
@MappableClass()
class CategoryModel with CategoryModelMappable {
  const CategoryModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.icon,
    required this.color,
    this.parentId,
    // Sync fields
    this.remoteId,
    this.isDirty = false,
    this.isDeleted = false,
    this.version = 0,
    this.lastSynced = 0,
  });

  /// UUID primary key, generated locally.
  final String id;

  /// Owner user ID.
  final String userId;

  /// Display label (e.g., "Food", "Transport").
  final String name;

  /// Icon identifier as text (e.g., "restaurant", "directions_car").
  final String icon;

  /// Color as hex string (e.g., "#4CAF50").
  final String color;

  /// Parent category ID for hierarchy. Null if top-level.
  final String? parentId;

  // --- Sync fields ---

  /// PocketBase record ID. Null when created offline.
  final String? remoteId;

  /// True when local changes need push.
  final bool isDirty;

  /// Soft deletion marker.
  final bool isDeleted;

  /// Conflict resolution counter.
  final int version;

  /// Unix timestamp (ms) of last successful sync.
  final int lastSynced;

  /// Convenience getters for serialization.
  static final fromMap = CategoryModelMapper.fromMap;
  static final fromJson = CategoryModelMapper.fromJson;
}
