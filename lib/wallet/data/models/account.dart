import 'package:dart_mappable/dart_mappable.dart';

part 'account.mapper.dart';

/// Represents a financial account (wallet, bank, card).
///
/// Per database_structure.md — accounts hold money.
/// They are the source and destination for all transactions.
@MappableClass()
class Account with AccountMappable {
  const Account({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    this.currency = 'USD',
    this.balance = 0.0,
    this.isArchived = false,
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

  /// Display name (e.g., "Chase Checking", "Cash").
  final String name;

  /// Account type: cash, bank, card.
  final String type;

  /// ISO currency code (e.g., "USD", "EGP").
  final String currency;

  /// Current balance.
  final double balance;

  /// Soft-hides account while preserving history.
  final bool isArchived;

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
  static final fromMap = AccountMapper.fromMap;
  static final fromJson = AccountMapper.fromJson;
}
