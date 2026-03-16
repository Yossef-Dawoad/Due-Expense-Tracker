import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_card.dart';

class BudgetCategoryList extends StatelessWidget {
  const BudgetCategoryList({super.key, required this.categories});

  final List<BudgetCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 32), // pb-8
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ), // px-1 mb-1 approx
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Budget categories',
                  style: context.textStyles.headingLG.copyWith(
                    fontSize: 18, // text-lg
                    fontWeight: FontWeight.w800, // font-extrabold
                    color: colors.textPrimary, // slate-900
                  ),
                ),
                Text(
                  '${categories.length} TOTAL',
                  style: context.textStyles.labelSM.copyWith(
                    fontSize: 10, // text-[10px]
                    fontWeight: FontWeight.w700, // font-bold
                    color: colors.semanticNeutral, // slate-500
                    letterSpacing: 1.0, // tracking-wider
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          if (categories.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colors.bgSurface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colors.borderDefault),
              ),
              child: Text(
                'No budgets yet. Create one to start tracking your spending rhythm.',
                style: context.textStyles.bodyMD.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
          if (categories.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: 8), // space-y-2 -> 8px
              itemBuilder: (context, index) => BudgetCategoryCard(
                category: categories[index],
                animationDelay: Duration(milliseconds: 120 + (index * 70)),
              ),
            ),
        ],
      ),
    );
  }
}
