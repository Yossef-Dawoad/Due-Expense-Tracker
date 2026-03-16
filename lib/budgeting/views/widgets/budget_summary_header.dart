import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_circular_progress_ring.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetSummaryHeader extends StatelessWidget {
  const BudgetSummaryHeader({super.key, required this.summary});

  final BudgetSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;

    return AppSurfaceCard(
      padding: EdgeInsets.all(spacing.cardPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 360;

          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _BudgetPeriodLabel(label: 'MONTHLY BUDGET'),
                        SizedBox(height: spacing.s2),
                        OdometerText(
                          value: summary.totalBudget,
                          prefix: '\$',
                          decimalPlaces: 0,
                          startDelay: const Duration(milliseconds: 80),
                          digitStagger: const Duration(milliseconds: 45),
                          style: textStyles.displayMD.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            letterSpacing: -0.8,
                          ),
                        ),
                        SizedBox(height: spacing.s2),
                        Text(
                          'Allocated across all active categories this month.',
                          style: textStyles.bodySM.copyWith(
                            color: colors.textTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: spacing.s3),
                        AppPillBadge(
                          label:
                              '${summary.overallSpentPercentage}% used so far this month',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: spacing.s4),
                  BudgetCircularProgressRing(
                    spentFraction: summary.overallSpentFraction,
                    percentageLabel: '${summary.overallSpentPercentage}%',
                    size: isCompact ? 112 : 128,
                  ),
                ],
              ),
              SizedBox(height: spacing.s4),
              Row(
                children: [
                  Expanded(
                    child: _SummaryMetricTile(
                      label: 'REMAINING',
                      value: summary.remainingAmount,
                      icon: Icons.wallet_outlined,
                      accentColor: colors.brandPrimary,
                      startDelay: const Duration(milliseconds: 180),
                    ),
                  ),
                  SizedBox(width: spacing.s3),
                  Expanded(
                    child: _SummaryMetricTile(
                      label: 'SPENT',
                      value: summary.spentAmount,
                      icon: Icons.trending_up_rounded,
                      accentColor: colors.semanticNegative,
                      startDelay: const Duration(milliseconds: 280),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
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
        color: colors.textTertiary,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.6,
      ),
    );
  }
}

class _SummaryMetricTile extends StatelessWidget {
  const _SummaryMetricTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.accentColor,
    required this.startDelay,
  });

  final String label;
  final double value;
  final IconData icon;
  final Color accentColor;
  final Duration startDelay;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.kitColors;
    final spacing = context.spacing;

    return AppSurfaceCard(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.s3,
        vertical: spacing.s3,
      ),
      backgroundColor: colors.bgBase,
      borderColor: colors.borderLight,
      borderRadius: context.borderRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: context.borderRadius.iconContainer,
                ),
                child: Icon(icon, color: accentColor, size: 18),
              ),
              SizedBox(width: spacing.s3),
              Expanded(
                child: Text(
                  label,
                  style: textStyles.labelSM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.s3),
          OdometerText(
            value: value,
            prefix: '\$',
            decimalPlaces: 0,
            startDelay: startDelay,
            digitStagger: const Duration(milliseconds: 40),
            style: textStyles.headingMD.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
