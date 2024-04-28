import 'package:expancetracker/features/transactions/views/widgets/transactions_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bar_charts.dart';

class ExpansesTabScreen extends StatelessWidget {
  const ExpansesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: TransactionHistoryBarChar()),
        SliverFillRemaining(
          child: TransactionListView(),
        ),
      ],
    );
  }
}
