import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'transaction_tile.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TransactionsBloc>()..add(const FetchedAllTransactions()),
      child: BlocBuilder<TransactionsBloc, TransactionState>(
        builder: (context, state) {
          //TODO handle error WITH IMAGE and something wrong happen
          //TODO handle loading with shimmers
          return state.maybeWhen(
              fetshedSuccess: (transactions) => ListView.separated(
                    itemBuilder: (_, idx) =>
                        TransactionTileWidget(transaction: transactions[idx]),
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemCount: transactions.length,
                  ),
              // failure: ,
              orElse: () => const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
