import 'package:expancetracker/features/overview_card/data/services/summary_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview_summary_event.dart';
part 'overview_summary_state.dart';
part 'overview_summary_bloc.freezed.dart';

class OverviewSummaryBloc
    extends Bloc<OverviewSummaryEvent, OverviewSummaryState> {
  final OverviewSummaryService _service;
  OverviewSummaryBloc(this._service) : super(const _Initial()) {
    on<OverviewGetTotalTransaciton>(_totalTransaction);
    on<OverviewGetTotalIncome>(_totalIncome);
    on<OverviewGetTotalExpense>(_totalExpense);
  }

  void _totalTransaction(event, emit) async {
    emit(const TotalTransactionLoading());
    try {
      final totalAmount = await _service.getTotalTransactionsAmount();
      emit(TotalTransactionSuccess(totalAmount));
    } catch (e) {
      emit(TotalTransactionFailure(e.toString()));
    }
  }

  void _totalIncome(event, emit) async {
    emit(const TotalIncomeLoading());
    try {
      final totalAmount = await _service.getTotalIncomeAmount();
      emit(TotalIncomeSuccess(totalAmount));
    } catch (e) {
      emit(TotalIncomeFailure(e.toString()));
    }
  }

  void _totalExpense(event, emit) async {
    emit(const TotalExpenseLoading());
    try {
      final totalAmount = await _service.getTotalExpanseAmount();
      emit(TotalExpenseSuccess(totalAmount));
    } catch (e) {
      emit(TotalExpenseFailure(e.toString()));
    }
  }
}
