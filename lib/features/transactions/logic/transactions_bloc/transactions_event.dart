part of 'transactions_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.started() = _Started;
  const factory TransactionEvent.addedNewExpense(UserTransaction transaction) =
      AddedNewTransaction;
  const factory TransactionEvent.fetchedExpense() = FetchedAllTransactions;
}
