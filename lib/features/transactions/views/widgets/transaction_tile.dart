import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/categories/data/models/transaction_category.dart';
import 'package:expancetracker/features/transactions/data/models/user_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TransactionTileWidget extends StatelessWidget {
  const TransactionTileWidget({
    super.key,
    required this.transaction,
  });

  final UserTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d, MMM').format(transaction.datetime);
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(transaction.category.color),
                    radius: 32,
                    child: Icon(transaction.category.icon),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      transaction.category.title,
                      style:
                          f18BlackBold.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  transaction.category.status == TransactionStatus.expense
                      ? const Icon(Icons.arrow_downward, color: Colors.red)
                      : const Icon(Icons.arrow_upward, color: Colors.green),
                  const SizedBox(width: 4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$${transaction.amount}', style: f18BlackBold),
                      Text(dateFormat, style: f14greyRegularText)
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
