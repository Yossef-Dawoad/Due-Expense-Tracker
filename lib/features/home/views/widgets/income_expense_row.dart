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
        Row(
          children: [
            IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: Color(0xFFEBEBEB),
              ),
              icon: const Icon(Iconsax.arrow_up_3, size: 25),
              onPressed: () {},
              color: Colors.green,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Income',
                  style: f14greyRegularText.copyWith(color: Colors.white),
                ),
                Text(
                  income.toString(),
                  style: f18WhiteBold,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFE0E0E0),
              ),
              icon: const Icon(Iconsax.arrow_down, size: 25),
              onPressed: () {},
              color: Colors.redAccent,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expenses',
                  style: f14greyRegularText.copyWith(color: Colors.white),
                ),
                Text(
                  expence.toString(),
                  style: f18WhiteBold,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
