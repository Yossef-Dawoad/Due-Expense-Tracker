/// Transaction type enum per database_structure.md.
///
/// Determines money flow direction:
/// - [expense]: money leaves the account
/// - [income]: money enters the account
/// - [transfer]: money moves between accounts (requires two transactions)
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
