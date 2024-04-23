import 'package:expancetracker/core/common/domain/services/intrefaces/firebase_base.dart';
import 'package:expancetracker/features/home/domain/models/money_transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_expense_event.dart';
part 'add_expense_state.dart';
part 'add_expense_bloc.freezed.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final BaseFirebaseTransctionDB _firebaseTransctionDB;
  AddExpenseBloc(this._firebaseTransctionDB) : super(const _Initial()) {
    on<AddedNewExpenseEv>(_onAddingNewExpense);
  }

  void _onAddingNewExpense(AddedNewExpenseEv event, Emitter emit) async {
    emit(const AddExpenseState.loading());
    try {
      await _firebaseTransctionDB.setNewTransction(event.transaction);
      emit(const AddExpenseState.success());
    } on Exception catch (e) {
      emit(AddExpenseState.failure(e.toString()));
    }
  }
}
