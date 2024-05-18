import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/core/common/widgets/skelton/skeleton_transaction_shimmer.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:expancetracker/features/transactions/views/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bar_charts.dart';

class ExpansesTabScreen extends StatelessWidget {
  const ExpansesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Transactions Charts
        const SliverToBoxAdapter(child: TransactionHistoryBarChar()),
        // Transaction Sliver
        BlocProvider(
          create: (context) => sl<TransactionsBloc>()..add(const FetchedAllTransactions()),
          child: BlocBuilder<TransactionsBloc, TransactionState>(
            buildWhen: (prev, curr) =>
                curr is TransactionLoading ||
                curr is TransactionFetchSuccess ||
                curr is TransactionFetchFailure,
            builder: (context, state) {
              //TODO handle error WITH IMAGE and something wrong happen
              return state.maybeWhen(
                fetchSuccess: (transactions) => SliverList.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: transactions.length,
                  itemBuilder: (_, idx) => TransactionTileWidget(transaction: transactions[idx]),
                ),
                orElse: () => SliverList.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: 6,
                  itemBuilder: (_, idx) => const SkeletonTransactionTiles(),
                ),
              );
            },
          ),
        ),
        // TransactionListView(),
      ],
    );
  }
}
