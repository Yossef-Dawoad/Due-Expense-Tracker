part of 'transactions_bloc.dart';

sealed class TransactionState {
  const TransactionState();
}

class _InitialTransactionStarted extends TransactionState {
  const _InitialTransactionStarted();
}

class TransactionLoading extends TransactionState {
  const TransactionLoading();
}

class TransactionAddSuccess extends TransactionState {
  const TransactionAddSuccess(this.transaction);
  final UserTransaction transaction;
}

class TransactionAddFailure extends TransactionState {
  const TransactionAddFailure(this.error);
  final String error;
}

class TransactionFetchFailure extends TransactionState {
  const TransactionFetchFailure(this.error);
  final String error;
}

class TransactionFetchSuccess extends TransactionState {
  const TransactionFetchSuccess(this.transactions);
  final List<UserTransaction> transactions;
}
