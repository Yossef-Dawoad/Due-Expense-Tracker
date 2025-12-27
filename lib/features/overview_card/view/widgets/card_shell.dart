import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/overview_card/logic/overview_summary_bloc/overview_summary_bloc.dart';
import 'package:expancetracker/features/overview_card/view/widgets/single_transaction_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class GradientColorfulContainer extends StatelessWidget {
  const GradientColorfulContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

class CardContentWidget extends StatelessWidget {
  const CardContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total Balance',
          style: f18BlackBold.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        BlocBuilder<OverviewSummaryBloc, OverviewSummaryState>(
          buildWhen: (prev, curr) =>
              curr is OverviewSummaryLoading ||
              curr is TotalTransactionSuccess ||
              curr is OverviewSummaryFailure,
          builder: (context, state) => switch (state) {
            OverviewSummaryLoading() => const CircularProgressIndicator(),
            TotalTransactionSuccess(:final totalAmount) => Text(
              '\$ $totalAmount',
              style: f38BlackBold.copyWith(color: Colors.white),
            ),
            _ => Text(
              '\$ ---,--',
              style: f38BlackBold.copyWith(color: Colors.white),
            ),
          },
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<OverviewSummaryBloc, OverviewSummaryState>(
              buildWhen: (prev, curr) =>
                  curr is OverviewSummaryLoading ||
                  curr is TotalIncomeRequested ||
                  curr is OverviewSummaryFailure,
              builder: (context, state) => switch (state) {
                OverviewSummaryLoading() => const CircularProgressIndicator(),
                TotalTransactionSuccess(:final totalAmount) =>
                  TransactionTotalSummary(
                    title: 'income',
                    amount: totalAmount,
                    color: Colors.green,
                    icon: Iconsax.arrow_up_3,
                  ),
                _ => const TransactionTotalSummary(
                  title: 'income',
                  amount: 0.0,
                  color: Colors.green,
                  icon: Iconsax.arrow_up_3,
                ),
              },
            ),
            BlocBuilder<OverviewSummaryBloc, OverviewSummaryState>(
              buildWhen: (prev, curr) =>
                  curr is OverviewSummaryLoading ||
                  curr is TotalTransactionSuccess ||
                  curr is OverviewSummaryFailure,
              builder: (context, state) => switch (state) {
                OverviewSummaryLoading() => const CircularProgressIndicator(),
                TotalTransactionSuccess(:final totalAmount) =>
                  TransactionTotalSummary(
                    title: 'expense',
                    amount: totalAmount,
                    color: Colors.redAccent[700]!,
                    icon: Iconsax.arrow_down,
                  ),
                _ => TransactionTotalSummary(
                  title: 'expense',
                  amount: 0.0,
                  color: Colors.redAccent[700]!,
                  icon: Iconsax.arrow_down,
                ),
              },
            ),
          ],
        ),
      ],
    );
  }
}
