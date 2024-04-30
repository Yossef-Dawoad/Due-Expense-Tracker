part of 'transactions_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.addloading() = TransactionAddLoading;
  const factory TransactionState.addSuccess() = TransactionAddSuccess;
  const factory TransactionState.addFailure(String message) =
      TransactionAddFailure;

  const factory TransactionState.fetchloading() = TransactionFetchLoading;
  const factory TransactionState.fetchSuccess(
      List<UserTransaction> transactions) = TransactionFetchedSuccess;
  const factory TransactionState.fetchFailure(String message) =
      TransactionFetchFailure;
}
