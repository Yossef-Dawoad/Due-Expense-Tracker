import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/features/overview_card/logic/overview_summary_bloc/overview_summary_bloc.dart';
import 'package:expancetracker/features/overview_card/view/widgets/card_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverViewSummaryCard extends StatelessWidget {
  const OverViewSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OverviewSummaryBloc>(
      create: (context) => sl<OverviewSummaryBloc>()
        ..add(const OverviewGetTotalTransaciton())
        ..add(const OverviewGetTotalIncome())
        ..add(const OverviewGetTotalExpense()),
      child: const GradientColorfulContainer(child: CardContentWidget()),
    );
  }
}
