import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_icon_badge.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_progress_bar.dart';

/// Molecule: A full budget category card with icon, name, limit, and progress bar.
/// Matches the HTML `p-4 rounded-xl border border-primary/10 bg-white ios-shadow` cards.
class BudgetCategoryCard extends StatelessWidget {
  const BudgetCategoryCard({super.key, required this.category});

  final BudgetCategoryModel category;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final borderRadius = context.borderRadius;
    final shadows = context.shadows;
    final spacing = context.spacing;
    final accentColor = _accentColor(colors);
    final usageTone = _usageTone;

    return Container(
      padding: EdgeInsets.all(spacing.cardPaddingLG),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: borderRadius.xl,
        border: Border.all(color: accentColor.withValues(alpha: 0.18)),
        boxShadow: shadows.elevation2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CategoryCardHeader(
            category: category,
            accentColor: accentColor,
            usageTone: usageTone,
          ),
          SizedBox(height: spacing.s4),
          Wrap(
            spacing: spacing.s3,
            runSpacing: spacing.s3,
            children: [
              _BudgetMetricChip(
                label: 'Spent',
                value: '\$${category.spentAmount.toStringAsFixed(2)}',
                backgroundColor: accentColor.withValues(alpha: 0.10),
                textColor: colors.textPrimary,
              ),
              _BudgetMetricChip(
                label: 'Remaining',
                value: '\$${category.remainingAmount.toStringAsFixed(2)}',
                backgroundColor: usageTone.withValues(alpha: 0.12),
                textColor: colors.textPrimary,
              ),
            ],
          ),
          SizedBox(height: spacing.s4),
          BudgetCategoryProgressBar(
            spentFraction: category.spentFraction,
            remainingLabel: '${_spentPercent.round()}% used',
            spentLabel: 'Cap \$${category.totalBudget.toStringAsFixed(0)}',
            barColor: accentColor,
            trackColor: accentColor.withValues(alpha: 0.12),
            labelColor: colors.textTertiary,
          ),
        ],
      ),
    );
  }

  double get _spentPercent => category.spentFraction * 100;

  Color _accentColor(KitColorsExtension colors) {
    if (category.spentFraction >= 0.9) {
      return colors.semanticNegative;
    }
    if (category.spentFraction >= 0.7) {
      return const Color(0xFFD97706);
    }
    return colors.brandPrimary;
  }

  Color get _usageTone {
    if (category.spentFraction >= 0.9) {
      return const Color(0xFFF97316);
    }
    if (category.spentFraction >= 0.7) {
      return const Color(0xFFF59E0B);
    }
    return const Color(0xFF10B981);
  }
}

class _CategoryCardHeader extends StatelessWidget {
  const _CategoryCardHeader({
    required this.category,
    required this.accentColor,
    required this.usageTone,
  });

  final BudgetCategoryModel category;
  final Color accentColor;
  final Color usageTone;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BudgetCategoryIconBadge(iconData: category.iconData),
        SizedBox(width: spacing.s4), // 16px gap
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: textStyles.headingMD.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textPrimary,
                          ),
                        ),
                        SizedBox(height: spacing.s1),
                        Text(
                          'Keep this category balanced through the period.',
                          style: textStyles.caption.copyWith(
                            color: colors.textTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: spacing.s3),
                  _UsageBadge(
                    label: _statusLabel(category.spentFraction),
                    color: usageTone,
                  ),
                ],
              ),
              SizedBox(height: spacing.s4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Allocated',
                    style: textStyles.labelSM.copyWith(
                      color: colors.textTertiary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '\$${category.totalBudget.toStringAsFixed(2)}',
                    style: textStyles.bodyMD.copyWith(
                      fontWeight: FontWeight.w800,
                      color: accentColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _statusLabel(double fraction) {
    if (fraction >= 0.9) {
      return 'Watch';
    }
    if (fraction >= 0.7) {
      return 'On pace';
    }
    return 'Healthy';
  }
}

class _BudgetMetricChip extends StatelessWidget {
  const _BudgetMetricChip({
    required this.label,
    required this.value,
    required this.backgroundColor,
    required this.textColor,
  });

  final String label;
  final String value;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final borderRadius = context.borderRadius;
    final spacing = context.spacing;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.s3,
        vertical: spacing.s2,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius.pill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label ',
            style: textStyles.caption.copyWith(
              color: textColor.withValues(alpha: 0.72),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: textStyles.caption.copyWith(
              color: textColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _UsageBadge extends StatelessWidget {
  const _UsageBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final borderRadius = context.borderRadius;
    final spacing = context.spacing;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.s3,
        vertical: spacing.s2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: borderRadius.pill,
      ),
      child: Text(
        label,
        style: textStyles.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
