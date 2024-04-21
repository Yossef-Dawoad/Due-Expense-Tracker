import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../home/views/mainscreen.dart';
import 'bar_charts.dart';

class ExpansesTabScreen extends StatelessWidget {
  const ExpansesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: const TransactionHistoryBarChar()),
        SliverFillRemaining(
          child: TransactionHistory(),
        ),
      ],
    );
  }
}
