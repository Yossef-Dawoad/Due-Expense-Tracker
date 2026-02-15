import 'package:drift/drift.dart';
import 'package:expancetracker/core/database/mixins/sync_columns.dart';

/// Junction table linking transactions to tags (many-to-many).
///
/// Per database_structure.md — allows unlimited tagging per transaction.
class TransactionTagsTable extends Table with SyncColumns {
  /// UUID primary key, generated locally.
  TextColumn get id => text()();

  /// The transaction this tag is applied to.
  TextColumn get transactionId => text()();

  /// The tag applied to the transaction.
  TextColumn get tagId => text()();

  @override
  Set<Column> get primaryKey => {id};
}
