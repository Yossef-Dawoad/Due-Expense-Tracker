import '../datasources/transactions_remote_source.dart';

class TransactionRepository {
  final TransctionRemoteDataSource _transctionRemoteSource;

  TransactionRepository({required TransctionRemoteDataSource transctionRemoteSource})
      : _transctionRemoteSource = transctionRemoteSource;
}
