import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/data/models/transaction.dart';
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
      color: context.kitColors.bgSurface,
      margin: EdgeInsets.only(bottom: context.spacing.s4),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spacing.s6),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: isExpense
                        ? context.kitColors.semanticNegative.withValues(
                            alpha: 0.15,
                          )
                        : context.kitColors.semanticPositive.withValues(
                            alpha: 0.15,
                          ),
                    radius: 28,
                    child: Icon(
                      isExpense ? Icons.arrow_downward : Icons.arrow_upward,
                      color: isExpense
                          ? context.kitColors.semanticNegative
                          : context.kitColors.semanticPositive,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      transaction.note ?? transaction.type.name,
                      style: context.textStyles.headingMD.copyWith(
                        color: context.kitColors.textPrimary,
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
                      ? Icon(
                          Icons.arrow_downward,
                          color: context.kitColors.semanticNegative,
                          size: 16,
                        )
                      : Icon(
                          Icons.arrow_upward,
                          color: context.kitColors.semanticPositive,
                          size: 16,
                        ),
                  SizedBox(width: context.spacing.s1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${transaction.amount}',
                        style: context.textStyles.headingMD,
                      ),
                      Text(
                        dateFormat,
                        style: context.textStyles.bodySM.copyWith(
                          color: context.kitColors.textSecondary,
                        ),
                      ),
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
