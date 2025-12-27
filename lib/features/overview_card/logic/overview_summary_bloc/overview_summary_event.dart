part of 'overview_summary_bloc.dart';

sealed class OverviewSummaryEvent {
  const OverviewSummaryEvent();
}

final class FetchedAllTransactionsSummary extends OverviewSummaryEvent {
  const FetchedAllTransactionsSummary();
}

final class TotalIncomeRequested extends OverviewSummaryEvent {
  const TotalIncomeRequested();
}

final class TotalExpenseRequested extends OverviewSummaryEvent {
  const TotalExpenseRequested();
}

final class ClearedOverviewSummary extends OverviewSummaryEvent {
  const ClearedOverviewSummary();
}
