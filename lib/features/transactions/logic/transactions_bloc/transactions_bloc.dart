import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:expancetracker/core/common/domain/data/pre_defiend_transactions.dart';
import 'package:expancetracker/core/common/domain/intrefaces/firebase_base.dart';
import 'package:expancetracker/features/transactions/domain/models/user_transaction.dart';

part 'transactions_bloc.freezed.dart';
part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionEvent, TransactionState> {
  final BaseFireBaseDB<UserTransaction> _transactionService;
  TransactionsBloc(this._transactionService) : super(const _Initial()) {
    on<AddedNewTransaction>(_onAddingNewExpense);
    on<FetchedAllTransactions>(_onTransactionFetched);
  }

  void _onAddingNewExpense(AddedNewTransaction event, Emitter emit) async {
    emit(const TransactionState.addloading());
    try {
      await _transactionService.addNewItem(event.transaction);
      emit(const TransactionState.addSuccess());
    } on Exception catch (e) {
      emit(TransactionState.addFailure(e.toString()));
    }
  }

  void _onTransactionFetched(event, emit) async {
    emit(const TransactionState.fetchloading());
    try {
      final cloudTranscations = await _transactionService.getAllItems();
      final userTransactionlist = preDefinedTransactions + cloudTranscations;
      emit(TransactionState.fetchSuccess(userTransactionlist));
    } catch (e) {
      emit(TransactionState.fetchFailure(e.toString()));
    }
  }
}
