import 'package:expancetracker/core/common/domain/types/result.dart';
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
  FutureResult<List<UserTransaction>> fetchAllTransactions() {
    // TODO: implement fetchAllTransactions
    throw UnimplementedError();
  }

  @override
  FutureResult<UserTransaction> addNewTransaction(UserTransaction item) {
    // TODO: implement addNewTransaction
    throw UnimplementedError();
  }

  @override
  FutureResult<void> deleteTransaction(UserTransaction item) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }
}
