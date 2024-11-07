import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/databases/app_database.dart';
import 'package:expancetracker/core/common/databases/drift_mixins.dart';
import 'package:expancetracker/features/categories/domain/datasources/local/database/category_table.dart';

part 'transaction_table.g.dart';

@TableIndex(name: 'transactions_id', columns: {#id})
class Transactions extends Table with AutoIncrementingPK {
  TextColumn get note => text().nullable()();
  RealColumn get amount => real()();
  DateTimeColumn get datetime => dateTime().nullable()();
  IntColumn get category => integer().references(Categories, #id)();
}

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(
  tables: [Transactions, Categories],
  queries: {'getRowsCount': 'SELECT COUNT(id) from transactions;'},
)
class TransactionsDao extends DatabaseAccessor<AppDatabase> with _$TransactionsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TransactionsDao(super.db);

  Future<List<Transaction>> getAllTransactions() => select(transactions).get();
  Stream<List<Transaction>> watchAllTransactions() => select(transactions).watch();

  Future<int> insertCategory(Insertable<Category> category) {
    return into(categories).insert(category);
  }

  Future<int> insertTransaction(Insertable<Transaction> transaction) =>
      into(transactions).insert(transaction);
  Future<void> insertBulkTransaction(Iterable<Insertable<Transaction>> items) async =>
      await batch((btch) => btch.insertAll(transactions, items));
  Future<bool> updateTransaction(Insertable<Transaction> transaction) =>
      update(transactions).replace(transaction);
  Future<int> deleteTransaction(Insertable<Transaction> transaction) =>
      delete(transactions).delete(transaction);

  Future<bool> isDataBaseEmpty() async {
    final rowsCount = transactions.id.count();
    final stmt = select(transactions).addColumns([rowsCount]);
    final count = await stmt.map((r) => r.read(rowsCount)!).getSingle();
    return count > 0;
  }
}
