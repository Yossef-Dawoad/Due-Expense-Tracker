import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../home/views/home_screen.dart';
import 'bar_charts.dart';

class ExpansesTabScreen extends StatelessWidget {
  const ExpansesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: TransactionHistoryBarChar()),
        SliverFillRemaining(
          child: TransactionHistory(),
        ),
      ],
    );
  }
}
