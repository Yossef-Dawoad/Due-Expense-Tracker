import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A card showing budget remaining vs limit with an animated progress bar.
/// HTML ref: bg-white border-border-light rounded-2xl p-5 shadow-card
class BudgetOverviewCard extends StatelessWidget {
  const BudgetOverviewCard({
    super.key,
    required this.remaining,
    required this.limit,
    required this.percentUsed,
    required this.daysLeft,
  });

  final double remaining;
  final double limit;
  final double percentUsed;
  final int daysLeft;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Container(
      padding: const EdgeInsets.all(20), // HTML: p-5
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: context.borderRadius.xl,
        border: Border.all(color: colors.borderLight),
      ),
      child: Column(
        children: [
          // Remaining vs Limit row — HTML: flex justify-between items-end mb-3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Remaining
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HTML: text-[11px] font-bold uppercase tracking-wider mb-0.5
                  Text(
                    'REMAINING',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: colors.textTertiary,
                      letterSpacing: 0.55, // tracking-wider ≈ 0.05em × 11px
                    ),
                  ),
                  const SizedBox(height: 2), // mb-0.5
                  // HTML: text-[20px] font-black
                  OdometerText(
                    value: remaining,
                    prefix: '\$',
                    decimalPlaces: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: colors.textPrimary,
                    ),
                    duration: const Duration(milliseconds: 800),
                  ),
                ],
              ),
              // Limit
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // HTML: text-[11px] font-bold uppercase tracking-wider mb-0.5
                  Text(
                    'LIMIT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: colors.textTertiary,
                      letterSpacing: 0.55,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // HTML: text-[13px] font-bold
                  OdometerText(
                    value: limit,
                    prefix: '\$',
                    decimalPlaces: 2,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: colors.textPrimary,
                    ),
                    duration: const Duration(milliseconds: 800),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12), // HTML: mb-3
          // Progress bar — HTML: h-1.5 = 6px
          AnimatedProgressBar(
            progress: (percentUsed / 100).clamp(0.0, 1.0),
            progressColor: colors.chartProgressBar,
            backgroundColor: colors.chartProgressTrack,
            height: 6.0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          ),
          const SizedBox(height: 10), // HTML: mt-2.5
          // Footer labels — HTML: text-[11px] font-medium
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${percentUsed.toStringAsFixed(0)}% used',
                style: textStyles.labelSM.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$daysLeft days left',
                style: textStyles.labelSM.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
