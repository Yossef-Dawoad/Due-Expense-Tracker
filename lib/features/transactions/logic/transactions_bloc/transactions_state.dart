part of 'transactions_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.addedSuccess() = TransactionAddedSuccess;
  const factory TransactionState.fetshedSuccess(
      List<UserTransaction> transactions) = TransactionFetshedSuccess;

  const factory TransactionState.failure(String message) = _Failure;
}
