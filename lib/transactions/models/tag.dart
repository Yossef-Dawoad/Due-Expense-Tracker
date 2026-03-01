import 'package:dart_mappable/dart_mappable.dart';

part 'tag.mapper.dart';

/// Represents a user-defined tag for transaction labeling.
///
/// Per database_structure.md — more flexible than categories.
/// Examples: "vacation", "business", "tax-deductible".
@MappableClass()
class Tag with TagMappable {
  const Tag({
    required this.id,
    required this.userId,
    required this.name,
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

  /// Tag label.
  final String name;

  // --- Sync fields ---

  final String? remoteId;
  final bool isDirty;
  final bool isDeleted;
  final int version;
  final int lastSynced;

  /// Convenience getters for serialization.
  static final fromMap = TagMapper.fromMap;
  static final fromJson = TagMapper.fromJson;
}
