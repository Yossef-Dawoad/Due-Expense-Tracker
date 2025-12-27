import 'package:expancetracker/features/overview_card/domain/repositories/summary_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'overview_summary_event.dart';
part 'overview_summary_state.dart';

class OverviewSummaryBloc
    extends Bloc<OverviewSummaryEvent, OverviewSummaryState> {
  final OverviewSummaryRepository _service;
  OverviewSummaryBloc(this._service) : super(const OverviewSummaryInitial()) {
    on<FetchedAllTransactionsSummary>(_totalTransaction);
    on<TotalIncomeRequested>(_totalIncome);
    on<TotalExpenseRequested>(_totalExpense);
  }

  void _totalTransaction(event, emit) async {
    emit(const OverviewSummaryLoading());
    try {
      final totalAmount = await _service.getTotalTransactionsAmount();
      emit(TotalTransactionSuccess(totalAmount));
    } catch (e) {
      emit(OverviewSummaryFailure(e.toString()));
    }
  }

  void _totalIncome(event, emit) async {
    emit(const OverviewSummaryLoading());
    try {
      final totalAmount = await _service.getTotalIncomeAmount();
      emit(IncomeTransactionSuccess(totalAmount));
    } catch (e) {
      emit(OverviewSummaryFailure(e.toString()));
    }
  }

  void _totalExpense(event, emit) async {
    emit(const OverviewSummaryLoading());
    try {
      final totalAmount = await _service.getTotalExpanseAmount();
      emit(ExpenseTransactionSuccess(totalAmount));
    } catch (e) {
      emit(OverviewSummaryFailure(e.toString()));
    }
  }
}
