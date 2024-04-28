part of 'transactions_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.addedSuccess() = _AddedSuccess;
  const factory TransactionState.fetshedSuccess(
      List<UserTransaction> transactions) = _FetshedSuccess;

  const factory TransactionState.failure(String message) = _Failure;
}
