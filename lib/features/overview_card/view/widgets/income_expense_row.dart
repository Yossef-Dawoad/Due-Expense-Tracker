import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IncomeExpenseRow extends StatelessWidget {
  const IncomeExpenseRow({
    super.key,
    required this.income,
    required this.expence,
  });

  final double income;
  final double expence;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TransactionTotalSummary(
          title: 'income',
          amount: income,
          color: Colors.green,
          icon: Iconsax.arrow_up_3,
        ),
        TransactionTotalSummary(
          title: 'expense',
          amount: expence,
          color: Colors.redAccent[700]!,
          icon: Iconsax.arrow_down,
        ),
      ],
    );
  }
}

class TransactionTotalSummary extends StatelessWidget {
  const TransactionTotalSummary({
    super.key,
    required this.amount,
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final double amount;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.filled(
          style: IconButton.styleFrom(backgroundColor: const Color(0xFFEBEBEB)),
          icon: Icon(icon, size: 25),
          onPressed: () {},
          color: color,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: f14greyRegularText.copyWith(color: Colors.white)),
            Text(amount.toString(), style: f18WhiteBold),
          ],
        ),
      ],
    );
  }
}
