part of 'overview_summary_bloc.dart';

@freezed
class OverviewSummaryEvent with _$OverviewSummaryEvent {
  const factory OverviewSummaryEvent.started() = _Started;
  const factory OverviewSummaryEvent.getTotalTransaction() =
      OverviewGetTotalTransaciton;
  const factory OverviewSummaryEvent.getTotalIncome() = OverviewGetTotalIncome;
  const factory OverviewSummaryEvent.getTotalExpense() =
      OverviewGetTotalExpense;
}
