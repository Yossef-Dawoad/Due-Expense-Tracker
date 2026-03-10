import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_circular_progress_ring.dart';

/// Molecule: The upper summary section showing "MONTHLY BUDGET", the total amount,
/// and the circular progress ring — matching the HTML's `.text-center.mt-6` block.
class BudgetSummaryHeader extends StatelessWidget {
  const BudgetSummaryHeader({super.key, required this.summary});

  final BudgetSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;
    final borderRadius = context.borderRadius;
    final shadows = context.shadows;
    final currency = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return Container(
      padding: EdgeInsets.all(spacing.cardPaddingLG),
      decoration: BoxDecoration(
        borderRadius: borderRadius.xxl,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.bgSurface,
            colors.brandPrimary.withValues(alpha: 0.12),
          ],
        ),
        border: Border.all(color: colors.brandPrimary.withValues(alpha: 0.12)),
        boxShadow: shadows.elevation2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BudgetPeriodLabel(label: 'Budget pulse'),
                    SizedBox(height: spacing.s2),
                    Text(
                      'Your spending plan is ${summary.overallSpentPercentage}% committed.',
                      style: textStyles.headingLG.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: spacing.s2),
                    Text(
                      'Stay ahead of the month by watching what is left before the final stretch.',
                      style: textStyles.bodySM.copyWith(
                        color: colors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: spacing.s4),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.s3,
                  vertical: spacing.s2,
                ),
                decoration: BoxDecoration(
                  color: colors.bgBase.withValues(alpha: 0.82),
                  borderRadius: borderRadius.pill,
                ),
                child: Text(
                  DateFormat('MMM').format(DateTime.now()),
                  style: textStyles.caption.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.s6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currency.format(summary.totalBudget),
                      style: textStyles.displayLG.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.2,
                      ),
                    ),
                    SizedBox(height: spacing.s2),
                    Text(
                      'Allocated across all active budget categories.',
                      style: textStyles.bodySM.copyWith(
                        color: colors.textTertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: spacing.s5),
                    Wrap(
                      spacing: spacing.s3,
                      runSpacing: spacing.s3,
                      children: [
                        _SummaryMetricTile(
                          label: 'Spent so far',
                          value: currency.format(summary.spentAmount),
                          tint: colors.semanticNegative.withValues(alpha: 0.12),
                        ),
                        _SummaryMetricTile(
                          label: 'Left to use',
                          value: currency.format(summary.remainingAmount),
                          tint: colors.brandPrimary.withValues(alpha: 0.12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: spacing.s4),
              BudgetCircularProgressRing(
                spentFraction: summary.overallSpentFraction,
                percentageLabel: '${summary.overallSpentPercentage}%',
                size: 156,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BudgetPeriodLabel extends StatelessWidget {
  const _BudgetPeriodLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.kitColors;

    return Text(
      label,
      style: textStyles.labelSM.copyWith(
        color: colors.brandPrimary,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _SummaryMetricTile extends StatelessWidget {
  const _SummaryMetricTile({
    required this.label,
    required this.value,
    required this.tint,
  });

  final String label;
  final String value;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final borderRadius = context.borderRadius;
    final spacing = context.spacing;
    final colors = context.kitColors;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.s4,
        vertical: spacing.s3,
      ),
      decoration: BoxDecoration(color: tint, borderRadius: borderRadius.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: textStyles.caption.copyWith(
              color: colors.textTertiary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: spacing.s1),
          Text(
            value,
            style: textStyles.bodyMD.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
