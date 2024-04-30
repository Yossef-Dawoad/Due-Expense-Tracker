import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/overview_card/logic/overview_summary_bloc/overview_summary_bloc.dart';
import 'package:expancetracker/features/overview_card/view/widgets/income_expense_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradientColorfulContainer extends StatelessWidget {
  const GradientColorfulContainer({
    super.key,
    required this.child,
  });
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
  const CardContentWidget({
    super.key,
  });

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
              curr is TotalTransactionLoading ||
              curr is TotalTransactionSuccess ||
              curr is TotalTransactionFailure,
          builder: (context, state) => state.maybeWhen(
            totalTransactionLoading: () => const CircularProgressIndicator(),
            totalTransactionSuccess: (amount) => Text('\$ $amount',
                style: f38BlackBold.copyWith(color: Colors.white)),
            orElse: () => Text('\$ ---,--',
                style: f38BlackBold.copyWith(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 35),
        const IncomeExpenseRow(
          income: 2500.00,
          expence: 2500.00,
        )
      ],
    );
  }
}
