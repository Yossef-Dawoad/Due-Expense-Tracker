part of 'overview_summary_bloc.dart';

sealed class OverviewSummaryState {
  const OverviewSummaryState();
}

class OverviewSummaryInitial extends OverviewSummaryState {
  const OverviewSummaryInitial();
}

class OverviewSummaryLoading extends OverviewSummaryState {
  const OverviewSummaryLoading();
}

class TotalTransactionSuccess extends OverviewSummaryState {
  const TotalTransactionSuccess(this.totalAmount);
  final double totalAmount;
}

class IncomeTransactionSuccess extends OverviewSummaryState {
  const IncomeTransactionSuccess(this.totalAmount);
  final double totalAmount;
}

class ExpenseTransactionSuccess extends OverviewSummaryState {
  const ExpenseTransactionSuccess(this.totalAmount);
  final double totalAmount;
}

class OverviewSummaryFailure extends OverviewSummaryState {
  const OverviewSummaryFailure(this.error);
  final String error;
}
