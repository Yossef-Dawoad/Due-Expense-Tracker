part of 'add_expense_bloc.dart';

@freezed
class AddExpenseState with _$AddExpenseState {
  const factory AddExpenseState.initial() = _Initial;
  const factory AddExpenseState.loading() = _Loading;
  const factory AddExpenseState.success() = _Success;
  const factory AddExpenseState.failure(String message) = _Failure;
}
