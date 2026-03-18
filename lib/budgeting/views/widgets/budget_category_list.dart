import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_card.dart';
import 'package:expancetracker/core/common/widgets/app_content_section.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetCategoryList extends StatelessWidget {
  const BudgetCategoryList({super.key, required this.categories});

  final List<BudgetCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Padding(
      padding: const EdgeInsets.only(bottom: 32), // pb-8
      child: AppContentSection(
        title: 'Budget categories',
        headerSpacing: spacing.s1,
        trailing: Text(
          '${categories.length} TOTAL',
          style: context.textStyles.labelSM.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: colors.semanticNeutral,
            letterSpacing: 1.0,
          ),
        ),
        titleStyle: context.textStyles.headingLG.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: colors.textPrimary,
        ),
        child: categories.isEmpty
            ? AppSurfaceCard(
                width: double.infinity,
                padding: EdgeInsets.all(spacing.cardPaddingLG),
                borderRadius: BorderRadius.circular(24),
                child: Text(
                  'No category budgets yet. Keep this plan flexible or add focused category guardrails when you need them.',
                  style: context.textStyles.bodyMD.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) => BudgetCategoryCard(
                  category: categories[index],
                  animationDelay: Duration(milliseconds: 120 + (index * 70)),
                ),
              ),
      ),
    );
  }
}
