part of 'add_expense_bloc.dart';

@freezed
class AddExpenseEvent with _$AddExpenseEvent {
  const factory AddExpenseEvent.started() = _Started;
  const factory AddExpenseEvent.addedNewExpense(MoneyTransaction transaction) =
      AddedNewExpenseEv;
}
