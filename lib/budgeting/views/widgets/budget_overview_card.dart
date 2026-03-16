import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';
import 'package:expancetracker/core/common/widgets/animated_circular_progress_ring.dart';
import 'package:expancetracker/core/common/widgets/icon_metric_stat_pill.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetOverviewCard extends StatelessWidget {
  const BudgetOverviewCard({super.key, required this.summary});

  final BudgetSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    // bg-white rounded-3xl p-5 shadow-sm border border-border-defined mb-4
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors.bgSurface, // bg-white
        borderRadius: BorderRadius.circular(24), // rounded-3xl roughly 24px
        border: Border.all(color: colors.borderDefault), // border-slate-200
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
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
                      'Monthly Budget',
                      style: textStyles.labelSM.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: colors.semanticNeutral, // slate-500
                        letterSpacing: 1.0, // tracking-widest
                      ),
                    ),
                    OdometerText(
                      value: summary.totalBudget,
                      prefix: '\$',
                      decimalPlaces: 0,
                      startDelay: const Duration(milliseconds: 80),
                      digitStagger: const Duration(milliseconds: 45),
                      style: textStyles.displayLG.copyWith(
                        fontSize: 36, // 4xl
                        fontWeight: FontWeight.w900, // font-black
                        color: colors.textPrimary, // slate-900
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Allocated across all active categories.',
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
                progressValue: summary.overallSpentFraction,
                activeColor: colors.brandPrimaryDark, // brand-green
                trackColor: colors.borderLight, // text-slate-100
                size: 96,
                strokeWidth: 8,
                centerWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${summary.overallSpentPercentage}%',
                      style: TextStyle(
                        fontSize: 18, // text-lg
                        fontWeight: FontWeight.w900, // font-black
                        color: colors.textPrimary, // slate-900
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'SPENT',
                      style: TextStyle(
                        fontSize: 8, // text-[8px]
                        fontWeight: FontWeight.w700, // font-bold
                        color: colors.textTertiary, // slate-600
                        letterSpacing: -0.5, // tracking-tighter
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Inline Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: colors.brandPrimaryLight, // bg-brand-green-light
              borderRadius: BorderRadius.circular(8), // rounded-lg
              border: Border.all(
                color: colors.brandPrimary.withValues(alpha: 0.2),
              ),
            ),
            child: Text(
              '${summary.overallSpentPercentage}% used so far this month',
              style: textStyles.caption.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: colors.brandPrimaryDark, // brand-green
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Stats Grid
          Row(
            children: [
              Expanded(
                child: IconMetricStatPill(
                  label: 'Remaining',
                  value: summary.remainingAmount,
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: colors.brandPrimaryDark, // string brand-green
                  startDelay: const Duration(milliseconds: 180),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: IconMetricStatPill(
                  label: 'Spent',
                  value: summary.spentAmount,
                  icon: Icons.trending_up,
                  iconColor: colors.semanticNegative, // string brand-red
                  startDelay: const Duration(milliseconds: 280),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
