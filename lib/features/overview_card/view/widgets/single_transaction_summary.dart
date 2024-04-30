import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';

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
          style: IconButton.styleFrom(backgroundColor: const Color(0xFFF3F3F3)),
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
