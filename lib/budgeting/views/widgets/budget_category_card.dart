import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/core/common/widgets/animated_limit_progress_bar.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/common/widgets/semantic_status_badge.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetCategoryCard extends StatelessWidget {
  const BudgetCategoryCard({
    super.key,
    required this.category,
    this.animationDelay = Duration.zero,
  });

  final BudgetCategoryModel category;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    final fraction = category.spentFraction;
    final int percent = (fraction * 100).round();

    // Status Logic
    String badgeLabel;
    Color baseColor;

    if (fraction >= 0.9) {
      badgeLabel = 'WATCH';
      baseColor = colors.semanticNegative; // red-500
    } else if (fraction >= 0.7) {
      badgeLabel = 'ON PACE';
      baseColor = const Color(
        0xFFF97316,
      ); // Fallback orange-500 if orange is not a semantic token
    } else {
      badgeLabel = 'HEALTHY';
      baseColor = colors.semanticPositive; // emerald-600
    }

    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(24),
      boxShadow: context.shadows.elevation1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ColoredFeatureIcon(
                    icon: category.iconData,
                    baseColor: colors.brandPrimaryDark, // green-700
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: textStyles.bodyMD.copyWith(
                          fontSize: 16, // text-base
                          fontWeight: FontWeight.w900, // font-black
                          color: colors.textPrimary, // slate-900
                          height: 1.25, // leading-tight
                        ),
                      ),
                      Text(
                        '\$${category.totalBudget.toStringAsFixed(0)} LIMIT',
                        style: textStyles.labelSM.copyWith(
                          fontSize: 10, // text-[10px]
                          fontWeight: FontWeight.w700, // font-bold
                          color: colors.semanticNeutral, // slate-500
                          letterSpacing: 0.5, // tracking-wide
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SemanticStatusBadge(label: badgeLabel, baseColor: baseColor),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OdometerText(
                        value: category.spentAmount,
                        prefix: '\$',
                        decimalPlaces: 0,
                        startDelay: animationDelay,
                        digitStagger: const Duration(milliseconds: 30),
                        style: textStyles.bodyMD.copyWith(
                          fontSize: 16, // text-base
                          fontWeight: FontWeight.w900, // font-black
                          color: colors.textPrimary, // slate-900
                        ),
                      ),
                      Text(
                        ' spent',
                        style: textStyles.bodyMD.copyWith(
                          fontSize: 16, // text-base
                          fontWeight: FontWeight.w900, // font-black
                          color: colors.textPrimary, // slate-900
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedLimitProgressBar(
            fraction: fraction,
            barColor: baseColor,
            animationDuration: const Duration(milliseconds: 700),
          ),
          const SizedBox(height: 4), // mb-1 from progress bar to text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$percent% USED',
                style: textStyles.labelSM.copyWith(
                  fontSize: 10, // text-[10px]
                  fontWeight: FontWeight.w700, // font-bold
                  color: colors.textTertiary, // slate-600
                  letterSpacing: 0.5, // tracking-wide
                ),
              ),
              Text(
                '\$${category.remainingAmount.toStringAsFixed(0)} LEFT',
                style: textStyles.labelSM.copyWith(
                  fontSize: 10, // text-[10px]
                  fontWeight: FontWeight.w700, // font-bold
                  color: colors.textPrimary, // slate-900
                  letterSpacing: 0.5, // tracking-wide
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
