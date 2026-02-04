import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expancetracker/core/common/domain/data/pre_defiend_transactions.dart';
import 'package:expancetracker/core/common/domain/intrefaces/remote_base.dart';
import 'package:expancetracker/features/transactions/domain/models/user_transaction.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionEvent, TransactionState> {
  final RemoteDataBase<UserTransaction> _transactionService;
  TransactionsBloc(this._transactionService)
    : super(const _InitialTransactionStarted()) {
    on<AddedNewTransaction>(_onAddingNewExpense);
    on<FetchedAllTransactions>(_onTransactionFetched);
  }

  void _onAddingNewExpense(AddedNewTransaction event, Emitter emit) async {
    emit(const TransactionLoading());
    try {
      await _transactionService.addNewItem(event.transaction);
      emit(TransactionAddSuccess(event.transaction));
    } on Exception catch (e) {
      emit(TransactionAddFailure(e.toString()));
    }
  }

  void _onTransactionFetched(event, emit) async {
    emit(const TransactionLoading());
    // await Future.delayed(const Duration(minutes: 15), () {});

    try {
      final cloudTranscations = await _transactionService.getAllItems();
      final userTransactionlist = preDefinedTransactions + cloudTranscations;
      emit(TransactionFetchSuccess(userTransactionlist));
    } catch (e) {
      emit(TransactionFetchFailure(e.toString()));
    }
  }
}
