import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/transactions/data/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTileWidget extends StatelessWidget {
  const TransactionTileWidget({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d, MMM').format(transaction.date);
    final isExpense = transaction.type == TransactionType.expense;

    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: isExpense
                        ? Colors.red.shade100
                        : Colors.green.shade100,
                    radius: 32,
                    child: Icon(
                      isExpense ? Icons.arrow_downward : Icons.arrow_upward,
                      color: isExpense ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      transaction.note ?? transaction.type.name,
                      style: f18BlackBold.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  isExpense
                      ? const Icon(Icons.arrow_downward, color: Colors.red)
                      : const Icon(Icons.arrow_upward, color: Colors.green),
                  const SizedBox(width: 4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$${transaction.amount}', style: f18BlackBold),
                      Text(dateFormat, style: f14greyRegularText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
