part of 'transactions_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = TransactionLoading;
  const factory TransactionState.addSuccess() = TransactionAddSuccess;
  const factory TransactionState.fetchSuccess(
      List<UserTransaction> transactions) = TransactionFetchSuccess;

  const factory TransactionState.addfailure(String message) =
      TransactionAddFailure;
  const factory TransactionState.fetchfailure(String message) =
      TransactionFetchFailure;
}
