import 'package:expancetracker/core/common/domain/services/intrefaces/firebase_base.dart';
import 'package:expancetracker/features/home/domain/models/money_transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';
part 'expenses_bloc.freezed.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final BaseFirebaseTransctionDB _firebaseTransctionDB;
  ExpensesBloc(this._firebaseTransctionDB) : super(const _Initial()) {
    on<AddedNewExpenseEv>(_onAddingNewExpense);
    on<FetchedExpenseEv>(_onTransactionFetched);
  }

  void _onAddingNewExpense(AddedNewExpenseEv event, Emitter emit) async {
    emit(const ExpensesState.loading());
    try {
      await _firebaseTransctionDB.setNewTransction(event.transaction);
      emit(const ExpensesState.addedSuccess());
    } on Exception catch (e) {
      emit(ExpensesState.failure(e.toString()));
    }
  }

  void _onTransactionFetched(event, emit) async {
    emit(const ExpensesState.loading());
    try {
      final expenses = await _firebaseTransctionDB.getAllTransctions();
      emit(ExpensesState.fetshedSuccess(expenses));
    } catch (e) {
      emit(ExpensesState.failure(e.toString()));
    }
  }
}
