part of 'expenses_bloc.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = _Initial;
  const factory ExpensesState.loading() = _Loading;
  const factory ExpensesState.addedSuccess() = _AddedSuccess;
  const factory ExpensesState.fetshedSuccess(
      List<MoneyTransaction> transaction) = _FetshedSuccess;

  const factory ExpensesState.failure(String message) = _Failure;
}
