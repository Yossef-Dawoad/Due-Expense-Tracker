import 'package:dart_mappable/dart_mappable.dart';

part 'transaction.mapper.dart';

/// Represents a financial transaction (expense, income, or transfer).
///
/// Per database_structure.md — the most important entity.
/// Represents movement of money into, out of, or between accounts.
@MappableClass()
class Transaction with TransactionMappable {
  const Transaction({
    required this.id,
    required this.userId,
    required this.accountId,
    required this.amount,
    required this.type,
    required this.date,
    this.categoryId,
    this.note,
    this.isPending = false,
    this.externalId,
    this.transferGroupId,
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

  /// Account this transaction belongs to. Required.
  final String accountId;

  /// Category for reporting. Optional but recommended.
  final String? categoryId;

  /// Numeric value. Always positive, sign determined by [type].
  final double amount;

  /// Transaction type: expense, income, transfer.
  final TransactionType type;

  /// User description / notes.
  final String? note;

  /// When the transaction occurred (NOT when created in the app).
  final DateTime date;

  /// True when transaction is not yet cleared (bank-import support).
  final bool isPending;

  /// ID from bank/aggregator. Prevents duplicate imports.
  final String? externalId;

  /// Links paired transfer transactions.
  final String? transferGroupId;

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
  static final fromMap = TransactionMapper.fromMap;
  static final fromJson = TransactionMapper.fromJson;
}

/// Transaction type enum per database_structure.md.
///
/// Determines money flow direction:
/// - [expense]: money leaves the account
/// - [income]: money enters the account
/// - [transfer]: money moves between accounts (requires two transactions)
@MappableEnum()
enum TransactionType {
  expense,
  income,
  transfer;

  /// Parse from string (e.g., from PocketBase or Drift).
  static TransactionType fromString(String value) {
    return TransactionType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => TransactionType.expense,
    );
  }
}
