import 'package:expancetracker/budgeting/models/create_budget_category_draft.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_money_field.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class CreateBudgetCategorySelector extends StatefulWidget {
  const CreateBudgetCategorySelector({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
    required this.onAmountChanged,
    this.onInputFocusChanged,
  });

  final List<CreateBudgetCategoryDraft> categories;
  final void Function(String categoryId, bool isSelected) onSelectionChanged;
  final void Function(String categoryId, String value) onAmountChanged;
  final void Function(String inputId, bool isFocused)? onInputFocusChanged;

  @override
  State<CreateBudgetCategorySelector> createState() =>
      _CreateBudgetCategorySelectorState();
}

class _CreateBudgetCategorySelectorState
    extends State<CreateBudgetCategorySelector> {
  static const int _collapsedCategoryCount = 4;

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final categories = widget.categories;
    final selectedCategories = categories
        .where((category) => category.isSelected)
        .toList(growable: false);
    final hasExpandableCategories = categories.length > _collapsedCategoryCount;
    final visibleCategories = _isExpanded || !hasExpandableCategories
        ? categories
        : categories.take(_collapsedCategoryCount).toList(growable: false);

    if (categories.isEmpty) {
      return const _EmptyBudgetCategoryState();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CategorySelectionHeader(
          totalCount: categories.length,
          visibleCount: visibleCategories.length,
          isExpanded: _isExpanded,
          hasExpandableCategories: hasExpandableCategories,
          onToggleExpanded: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        SizedBox(height: spacing.s3),
        AnimatedSize(
          duration: context.durations.duration200,
          curve: Curves.easeOutCubic,
          child: _CategorySelectionGrid(
            categories: visibleCategories,
            onSelectionChanged: widget.onSelectionChanged,
          ),
        ),
        SizedBox(height: spacing.s4),
        _SelectedBudgetCategoryAllocations(
          categories: selectedCategories,
          onAmountChanged: widget.onAmountChanged,
          onInputFocusChanged: widget.onInputFocusChanged,
        ),
      ],
    );
  }
}

class _CategorySelectionHeader extends StatelessWidget {
  const _CategorySelectionHeader({
    required this.totalCount,
    required this.visibleCount,
    required this.isExpanded,
    required this.hasExpandableCategories,
    required this.onToggleExpanded,
  });

  final int totalCount;
  final int visibleCount;
  final bool isExpanded;
  final bool hasExpandableCategories;
  final VoidCallback onToggleExpanded;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent categories',
                style: textStyles.bodyMD.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                hasExpandableCategories
                    ? 'Showing $visibleCount of $totalCount categories, newest first.'
                    : 'Tap a category to include it in this budget.',
                style: textStyles.bodySM.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        if (hasExpandableCategories)
          TextButton.icon(
            onPressed: onToggleExpanded,
            icon: Icon(
              isExpanded
                  ? Icons.expand_less_rounded
                  : Icons.expand_more_rounded,
              size: 18,
            ),
            label: Text(isExpanded ? 'Show less' : 'See all'),
          ),
      ],
    );
  }
}

class _EmptyBudgetCategoryState extends StatelessWidget {
  const _EmptyBudgetCategoryState();

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      backgroundColor: colors.bgBase,
      borderRadius: context.borderRadius.xl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredFeatureIcon(
            icon: Icons.category_outlined,
            baseColor: colors.brandPrimaryDark,
            containerSize: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No categories yet',
                  style: textStyles.bodyMD.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Create categories from your transaction flow and they will appear here automatically for focused budgets.',
                  style: textStyles.bodySM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w500,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySelectionGrid extends StatelessWidget {
  const _CategorySelectionGrid({
    required this.categories,
    required this.onSelectionChanged,
  });

  final List<CreateBudgetCategoryDraft> categories;
  final void Function(String categoryId, bool isSelected) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 960 ? 3 : 2;
        final totalSpacing = spacing.s3 * (crossAxisCount - 1);
        final tileWidth =
            (constraints.maxWidth - totalSpacing) / crossAxisCount;

        return Wrap(
          spacing: spacing.s3,
          runSpacing: spacing.s3,
          children: [
            for (final category in categories)
              SizedBox(
                width: tileWidth,
                child: _CreateBudgetCategoryTile(
                  category: category,
                  onSelectionChanged: onSelectionChanged,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _SelectedBudgetCategoryAllocations extends StatelessWidget {
  const _SelectedBudgetCategoryAllocations({
    required this.categories,
    required this.onAmountChanged,
    this.onInputFocusChanged,
  });

  final List<CreateBudgetCategoryDraft> categories;
  final void Function(String categoryId, String value) onAmountChanged;
  final void Function(String inputId, bool isFocused)? onInputFocusChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final textStyles = context.textStyles;

    if (categories.isEmpty) {
      return AppSurfaceCard(
        padding: const EdgeInsets.all(16),
        backgroundColor: colors.bgBase,
        borderRadius: context.borderRadius.xl,
        child: Text(
          'Select one or more categories above and you can assign each one its own budget amount here.',
          style: textStyles.bodySM.copyWith(
            color: colors.textTertiary,
            fontWeight: FontWeight.w500,
            height: 1.45,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Allocations',
          style: textStyles.bodyMD.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: spacing.s1),
        Text(
          'Fine-tune how much room each selected category gets.',
          style: textStyles.bodySM.copyWith(
            color: colors.textTertiary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: spacing.s3),
        for (var index = 0; index < categories.length; index++) ...[
          _SelectedBudgetCategoryAllocationRow(
            category: categories[index],
            onAmountChanged: onAmountChanged,
            onInputFocusChanged: onInputFocusChanged,
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
  });

  final CreateBudgetCategoryDraft category;
  final void Function(String categoryId, bool isSelected) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final accentColor = category.accentColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelectionChanged(category.id, !category.isSelected),
        borderRadius: context.borderRadius.xl,
        child: AnimatedContainer(
          duration: context.durations.duration200,
          padding: const EdgeInsets.all(14),
          constraints: const BoxConstraints(minHeight: 126),
          decoration: BoxDecoration(
            color: category.isSelected
                ? accentColor.withValues(alpha: 0.12)
                : colors.bgBase,
            borderRadius: context.borderRadius.xl,
            border: Border.all(
              color: category.isSelected
                  ? accentColor.withValues(alpha: 0.35)
                  : colors.borderLight,
              width: category.isSelected ? 1.4 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ColoredFeatureIcon(
                    icon: category.iconData,
                    baseColor: accentColor,
                    containerSize: 36,
                  ),
                  const Spacer(),
                  Icon(
                    category.isSelected
                        ? Icons.check_circle_rounded
                        : Icons.add_circle_outline_rounded,
                    color: category.isSelected
                        ? accentColor
                        : colors.textTertiary,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                category.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyles.bodyMD.copyWith(
                  color: colors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                category.isSelected
                    ? 'Included in this budget'
                    : 'Tap to include',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyles.bodySM.copyWith(
                  color: category.isSelected
                      ? accentColor
                      : colors.textTertiary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectedBudgetCategoryAllocationRow extends StatelessWidget {
  const _SelectedBudgetCategoryAllocationRow({
    required this.category,
    required this.onAmountChanged,
    this.onInputFocusChanged,
  });

  final CreateBudgetCategoryDraft category;
  final void Function(String categoryId, String value) onAmountChanged;
  final void Function(String inputId, bool isFocused)? onInputFocusChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final textStyles = context.textStyles;
    final accentColor = category.accentColor;

    return AppSurfaceCard(
      padding: EdgeInsets.all(spacing.s3),
      backgroundColor: colors.bgBase,
      borderColor: accentColor.withValues(alpha: 0.18),
      borderRadius: context.borderRadius.xl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColoredFeatureIcon(
            icon: category.iconData,
            baseColor: accentColor,
            containerSize: 40,
          ),
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
                  category.spentAmount > 0
                      ? 'Spent so far: \$${category.spentAmount.toStringAsFixed(0)}'
                      : 'No tracked spend yet',
                  style: textStyles.bodySM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 118,
            child: CreateBudgetMoneyField(
              initialValue: category.allocationText,
              enabled: true,
              onChanged: (value) => onAmountChanged(category.id, value),
              onFocusChanged: (isFocused) {
                onInputFocusChanged?.call(category.id, isFocused);
              },
            ),
          ),
        ],
      ),
    );
  }
}
