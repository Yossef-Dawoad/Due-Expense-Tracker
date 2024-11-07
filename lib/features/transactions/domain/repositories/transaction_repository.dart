import 'package:drift/drift.dart';
import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/core/common/databases/app_database.dart';
import 'package:expancetracker/core/common/domain/types/result.dart';
import 'package:expancetracker/core/utils/logger/logger.dart';
import 'package:expancetracker/core/utils/network/network_manager.dart';
import 'package:expancetracker/features/transactions/domain/datasources/local/transaction_local_source.dart';

import '../datasources/remote/transactions_remote_source.dart';
import '../models/user_transaction.dart';

abstract interface class TransactionRepositoryInterface {
  FutureResult<List<UserTransaction>> fetchAllTransactions();
  FutureResult<UserTransaction> addNewTransaction(UserTransaction item);
  FutureResult<void> deleteTransaction(UserTransaction item);
}

class TransactionRepository implements TransactionRepositoryInterface {
  final UserTransactionRemoteInterface _transctionRemoteSource;
  final TransactionLocalSourceInterface _transactionLocalSource;

  TransactionRepository({
    required UserTransactionRemoteInterface transctionRemoteSource,
    required TransactionLocalSourceInterface transactionLocalSource,
  })  : _transctionRemoteSource = transctionRemoteSource,
        _transactionLocalSource = transactionLocalSource;

  @override
  FutureResult<List<UserTransaction>> fetchAllTransactions() async {
    final hasNetworkAvailable = await sl<NetworkManagerInterface>().hasInternetAccess;
    if (!hasNetworkAvailable) {
      return _fetchTransactionsFromLocal();
    } else {
      return _fetchTransactionsFromRemote();
    }
  }

  @override
  FutureResult<UserTransaction> addNewTransaction(UserTransaction item) async {
    // TODO: implement Error handling
    final category = CategoriesCompanion(
      title: Value(item.category.title),
      color: Value(item.category.color),
      icon: Value(item.category.icon),
      status: Value(item.category.status),
      totalAmount: Value(item.category.totalAmount),
    );
    final categoryId = await _transactionLocalSource.insertSubItem(category);
    final transaction = TransactionsCompanion(
      amount: Value(item.amount),
      note: Value(item.note),
      category: Value(categoryId!),
    );
    await _transactionLocalSource.insertItem(transaction);
    return Success(item);


  }

  @override
  FutureResult<void> deleteTransaction(UserTransaction item) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  FutureResult<List<UserTransaction>> _fetchTransactionsFromLocal() async {
    logger.i(
        'Error while Fetching From Remote OR No Internet Connection - Fetching from Local Database');
    try {
      final isDBEmpty = await _transactionLocalSource.isDataBaseEmpty();
      if (isDBEmpty) {
        return const Failure("No network connection and local database is empty");
      }
      final cachedDevices = await _transactionLocalSource.getAllItems();

      final cachedDeviceModels = cachedDevices?.map(
        (dbRecord) => UserTransaction.fromJson(dbRecord.toJson()),
      );
      return Success(cachedDeviceModels?.toList());
    } catch (err) {
      logger.e('Error reading from db', error: err);
      return const Failure("Something went wrong While Querying from Local DB");
    }
  }

  FutureResult<List<UserTransaction>> _fetchTransactionsFromRemote() async {
    try {
      final transactions = await _transctionRemoteSource.getAllItems();
      if (transactions.isEmpty) {
        logger.d('Remote source is empty - Falling back to local database');
        return _fetchTransactionsFromLocal();
      }
      logger.i('Remote source is not empty - Inserting into local database', error: transactions);
      await _transactionLocalSource.insertBulkItems(
        transactions.map(
          (ele) {
            final category = CategoriesCompanion(
              title: Value(ele.category.title),
              color: Value(ele.category.color),
              icon: Value(ele.category.icon),
              status: Value(ele.category.status),
              totalAmount: Value(ele.category.totalAmount),
            );
            // TODO: Handle category insert error
            final categoryId = await _transactionLocalSource.insertCategory(category);

            return TransactionsCompanion(
              amount: Value(ele.amount),
              note: Value(ele.note),
              category: category.id,
            );
          },
        ),
      );
      return Success(transactions);
    } catch (err) {
      logger.e('Error occurred while fetching from remote', error: err);
      return _fetchTransactionsFromLocal();
    }
  }
}
