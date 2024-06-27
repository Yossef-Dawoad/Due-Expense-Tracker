import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/databases/local_source_interface.dart';
import 'package:expancetracker/core/utils/logger/logger.dart';
import 'package:expancetracker/features/transactions/domain/datasources/local/database/transaction_table.dart';

typedef TransactionLocalSourceInterface = LocalSourceInterface<Transaction>;

class TransactionLocalSource implements TransactionLocalSourceInterface {
  final TransactionsDao _source;
  TransactionLocalSource(this._source);

  @override
  Future<int> deleteItem(Insertable<Transaction> transaction) async {
    return await _source.deleteTransaction(transaction);
  }

  @override
  Future<List<Transaction>?> getAllItems() async {
    try {
      return await _source.getAllTransactions();
    } catch (err) {
      logger.e('Error reading from db', error: err);
    }
    return null;
  }

  @override
  Future<int?> insertItem(Insertable<Transaction> transaction) async {
    try {
      return await _source.insertTransaction(transaction);
    } catch (err) {
      logger.e('Error reading from db', error: err);
    }
    return null;
  }

  @override
  Future<bool> updateItem(Insertable<Transaction> transaction) async {
    return await _source.updateTransaction(transaction);
  }

  @override
  Stream<List<Transaction>> watchAllItems() async* {
    yield* _source.watchAllTransactions();
  }

  @override
  Future<void> insertBulkItems(Iterable<Insertable<Transaction>> transactions) async {
    await _source.insertBulkTransaction(transactions);
  }

  @override
  Future<bool> isDataBaseEmpty() async {
    return await _source.isDataBaseEmpty();
  }
}
