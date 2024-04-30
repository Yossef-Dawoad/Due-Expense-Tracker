part of 'overview_summary_bloc.dart';

@freezed
class OverviewSummaryState with _$OverviewSummaryState {
  const factory OverviewSummaryState.initial() = _Initial;

  const factory OverviewSummaryState.totalTransactionLoading() =
      TotalTransactionLoading;
  const factory OverviewSummaryState.totalTransactionSuccess(double amount) =
      TotalTransactionSuccess;
  const factory OverviewSummaryState.totalTransactionFailure(String message) =
      TotalTransactionFailure;

  const factory OverviewSummaryState.totalIncomeLoading() = TotalIncomeLoading;
  const factory OverviewSummaryState.totalIncomeSuccess(double amount) =
      TotalIncomeSuccess;
  const factory OverviewSummaryState.totalIncomeFailure(String message) =
      TotalIncomeFailure;

  const factory OverviewSummaryState.totalExpenseLoading() =
      TotalExpenseLoading;
  const factory OverviewSummaryState.totalExpenseSuccess(double amount) =
      TotalExpenseSuccess;
  const factory OverviewSummaryState.totalExpenseFailure(String message) =
      TotalExpenseFailure;
}
