import 'package:expancetracker/budgeting/models/create_budget_category_draft.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_icon_badge.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_money_field.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class CreateBudgetCategorySelector extends StatelessWidget {
  const CreateBudgetCategorySelector({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
    required this.onAmountChanged,
  });

  final List<CreateBudgetCategoryDraft> categories;
  final void Function(String categoryId, bool isSelected) onSelectionChanged;
  final void Function(String categoryId, String value) onAmountChanged;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      children: [
        for (var index = 0; index < categories.length; index++) ...[
          _CreateBudgetCategoryTile(
            category: categories[index],
            onSelectionChanged: onSelectionChanged,
            onAmountChanged: onAmountChanged,
          ),
          if (index != categories.length - 1) SizedBox(height: spacing.s3),
        ],
      ],
    );
  }
}

class _CreateBudgetCategoryTile extends StatelessWidget {
  const _CreateBudgetCategoryTile({
    required this.category,
    required this.onSelectionChanged,
    required this.onAmountChanged,
  });

  final CreateBudgetCategoryDraft category;
  final void Function(String categoryId, bool isSelected) onSelectionChanged;
  final void Function(String categoryId, String value) onAmountChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final textStyles = context.textStyles;

    return AnimatedContainer(
      duration: context.durations.duration200,
      padding: EdgeInsets.all(spacing.s3),
      decoration: BoxDecoration(
        color: category.isSelected
            ? colors.bgBase
            : colors.bgBase.withValues(alpha: 0.55),
        borderRadius: context.borderRadius.xl,
        border: Border.all(
          color: category.isSelected
              ? colors.brandPrimary.withValues(alpha: 0.26)
              : colors.borderLight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: category.isSelected,
            onChanged: (value) =>
                onSelectionChanged(category.id, value ?? false),
            activeColor: colors.brandPrimary,
            visualDensity: VisualDensity.compact,
          ),
          SizedBox(width: spacing.s1),
          BudgetCategoryIconBadge(iconData: category.iconData),
          SizedBox(width: spacing.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: textStyles.bodyMD.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: spacing.s1),
                Text(
                  'Spent so far: \$${category.spentAmount.toStringAsFixed(0)}',
                  style: textStyles.bodySM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 112,
            child: CreateBudgetMoneyField(
              initialValue: category.allocationText,
              enabled: category.isSelected,
              onChanged: (value) => onAmountChanged(category.id, value),
            ),
          ),
        ],
      ),
    );
  }
}
