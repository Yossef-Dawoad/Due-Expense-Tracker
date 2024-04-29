import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/transactions/domain/models/user_transaction.dart';
import 'package:flutter/material.dart';
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
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(transaction.category.color),
            radius: 35,
            child: Icon(transaction.category.icon),
          ),
          title: Text(transaction.category.title, style: f18BlackBold),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$${transaction.amount}', style: f18BlackBold),
              Text(dateFormat, style: f14greyRegularText)
            ],
          ),
        ),
      ),
    );
  }
}
