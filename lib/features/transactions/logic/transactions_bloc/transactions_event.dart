part of 'transactions_bloc.dart';

sealed class TransactionEvent {
  const TransactionEvent();
}

class AddedNewTransaction extends TransactionEvent {
  const AddedNewTransaction(this.transaction);
  final UserTransaction transaction;
}

class FetchedAllTransactions extends TransactionEvent {
  const FetchedAllTransactions();
}
