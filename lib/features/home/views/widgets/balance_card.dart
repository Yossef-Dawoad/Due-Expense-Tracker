import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';

import 'income_expense_row.dart';

class BalanceCardSkelton extends StatelessWidget {
  const BalanceCardSkelton({
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
            offset: Offset(0, 3), // changes position of shadow
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
        Text(
          '\$ 4800.00',
          style: f38BlackBold.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 35),
        const IncomeExpenseRow(
          income: 2500.00,
          expence: 1200.00,
        )
      ],
    );
  }
}
