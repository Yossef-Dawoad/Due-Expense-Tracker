import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_card.dart';

/// Organism: The "ACTIVE BUDGETS" section — a header label and a list of
/// [BudgetCategoryCard]s spaced 16px apart.
class BudgetCategoryList extends StatelessWidget {
  const BudgetCategoryList({super.key, required this.categories});

  final List<BudgetCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active budgets',
                    style: textStyles.headingLG.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: spacing.s1),
                  Text(
                    'Track each category before it starts eating into your goals.',
                    style: textStyles.bodySM.copyWith(
                      color: colors.textTertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: spacing.s3,
                vertical: spacing.s2,
              ),
              decoration: BoxDecoration(
                color: colors.brandPrimary.withValues(alpha: 0.10),
                borderRadius: context.borderRadius.pill,
              ),
              child: Text(
                '${categories.length} live',
                style: textStyles.caption.copyWith(
                  color: colors.brandPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: spacing.s5),
        if (categories.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(spacing.cardPaddingLG),
            decoration: BoxDecoration(
              color: colors.bgSurface,
              borderRadius: context.borderRadius.xl,
              border: Border.all(color: colors.borderLight),
            ),
            child: Text(
              'No budgets yet. Create one to start tracking your spending rhythm.',
              style: textStyles.bodyMD.copyWith(color: colors.textSecondary),
            ),
          ),
        if (categories.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (_, _) => SizedBox(height: spacing.listItemGap),
            itemBuilder: (context, index) =>
                BudgetCategoryCard(category: categories[index]),
          ),
      ],
    );
  }
}
