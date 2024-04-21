import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/home/domain/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: transaction.color,
            radius: 35,
            child: Icon(transaction.icon),
          ),
          title: Text(transaction.title, style: f18BlackBold),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$${transaction.amount}', style: f18BlackBold),
              Text(
                '${transaction.datetime.day}',
                style: f14greyRegularText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
