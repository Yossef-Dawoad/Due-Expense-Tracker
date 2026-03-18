import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/common/widgets/animated_circular_progress_ring.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/metric_stat_pill_pair.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetSummarySpotlightCard extends StatelessWidget {
  const BudgetSummarySpotlightCard({
    super.key,
    required this.eyebrow,
    required this.totalBudget,
    required this.supportingText,
    required this.spentFraction,
    required this.spentPercentageLabel,
    required this.highlightLabel,
    required this.leadingMetric,
    required this.trailingMetric,
  });

  final String eyebrow;
  final double totalBudget;
  final String supportingText;
  final double spentFraction;
  final String spentPercentageLabel;
  final String highlightLabel;
  final MetricStatPillData leadingMetric;
  final MetricStatPillData trailingMetric;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return AppSurfaceCard(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      borderRadius: BorderRadius.circular(24),
      borderColor: colors.borderDefault,
      boxShadow: context.shadows.elevation1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eyebrow,
                      style: textStyles.labelSM.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: colors.semanticNeutral,
                        letterSpacing: 1.0,
                      ),
                    ),
                    OdometerText(
                      value: totalBudget,
                      prefix: r'$',
                      decimalPlaces: 0,
                      startDelay: const Duration(milliseconds: 80),
                      digitStagger: const Duration(milliseconds: 45),
                      style: textStyles.displayLG.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: colors.textPrimary,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      supportingText,
                      style: textStyles.caption.copyWith(
                        fontSize: 11,
                        color: colors.textTertiary,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              AnimatedCircularProgressRing(
                progressValue: spentFraction,
                activeColor: colors.brandPrimaryDark,
                trackColor: colors.borderLight,
                size: 96,
                strokeWidth: 8,
                centerWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      spentPercentageLabel,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: colors.textPrimary,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'SPENT',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: colors.textTertiary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppPillBadge(
            label: highlightLabel,
            backgroundColor: colors.brandPrimaryLight,
            textColor: colors.brandPrimaryDark,
            borderColor: colors.brandPrimary.withValues(alpha: 0.2),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            textStyle: textStyles.caption.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: colors.brandPrimaryDark,
            ),
          ),
          const SizedBox(height: 16),
          MetricStatPillPair(
            leadingMetric: leadingMetric,
            trailingMetric: trailingMetric,
          ),
        ],
      ),
    );
  }
}
