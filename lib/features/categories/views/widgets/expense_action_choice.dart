import 'package:expancetracker/features/categories/data/models/transaction_category.dart';
import 'package:expancetracker/features/categories/logic/category_user_input_provider/category_user_input_provider.dart';
import 'package:flutter/material.dart';

class ExpenseActionChoice extends StatefulWidget {
  const ExpenseActionChoice({super.key});

  @override
  State<ExpenseActionChoice> createState() => _ExpenseActionChoiceState();
}

class _ExpenseActionChoiceState extends State<ExpenseActionChoice> {
  TransactionStatus? _val = TransactionStatus.expense;

  @override
  Widget build(BuildContext context) {
    final userData = CategoryUserInputProvider.of(context);

    return Wrap(
      spacing: 5.0,
      children: TransactionStatus.values
          .map(
            (transactionStat) => ChoiceChip(
              label: Text(transactionStat.name),
              selected: _val == transactionStat,
              onSelected: (bool selected) {
                setState(() => _val = selected ? transactionStat : null);
                if (_val != null) userData.updateCategoryStatus(_val!);
              },
            ),
          )
          .toList(),
    );
  }
}
