import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Recent activity section displayed as a flat list of transaction items,
/// each with an icon container, category name, time/source, and amount.
/// Wraps items in a StaggeredListAnimation for cascading entrance.
class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({
    super.key,
    required this.transactions,
    required this.categories,
    this.animationDelay = Duration.zero,
  });

  final List<Transaction> transactions;
  final List<CategoryModel> categories;

  /// Delay before starting the staggered entrance animation.
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const SizedBox.shrink();
    }

    final items = transactions.map((tx) {
      final category = categories.firstWhere(
        (c) => c.id == tx.categoryId,
        orElse: () => CategoryModel(
          id: 'unknown',
          name: 'Unknown',
          icon: '❓',
          color: '0xFF9E9E9E',
          userId: '',
        ),
      );
      return _RecentActivityItem(transaction: tx, category: category);
    }).toList();

    return StaggeredListAnimation(
      delay: animationDelay,
      staggerDuration: const Duration(milliseconds: 50),
      itemDuration: AnimationDurations.medium,
      children: items,
    );
  }
}

class _RecentActivityItem extends StatelessWidget {
  const _RecentActivityItem({
    required this.transaction,
    required this.category,
  });

  final Transaction transaction;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final isExpense = transaction.type == TransactionType.expense;
    final formattedTime = DateFormat('h:mm a').format(transaction.date);
    final displayName = (transaction.note?.isNotEmpty ?? false)
        ? transaction.note!
        : category.name;

    // HTML: flex items-center justify-between py-3
    return ScaleFeedback(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12), // HTML: py-3
        child: Row(
          children: [
            // Icon container
            _CategoryIconContainer(category: category),
            const SizedBox(width: 16), // HTML: gap-4
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HTML: text-[15px] font-bold
                  Text(
                    displayName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // HTML: text-[12px] font-medium text-text-muted
                  Text(
                    '$formattedTime • ${category.name}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),

            // Amount — HTML: text-[15px] font-bold
            Text(
              '${isExpense ? "-" : "+"}\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryIconContainer extends StatelessWidget {
  const _CategoryIconContainer({required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    // HTML: size-11 rounded-xl border-border-light bg-white shadow-soft
    // size-11 = 44px, rounded-xl = 1.5rem = 24px
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: context.borderRadius.iconContainer,
        border: Border.all(color: colors.borderLight),
      ),
      child: Center(
        child: Text(category.icon, style: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
