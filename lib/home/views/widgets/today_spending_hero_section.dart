import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// Centered hero section displaying today's total spending amount
/// with a comparison badge showing percentage change from yesterday.
class TodaySpendingHeroSection extends StatelessWidget {
  const TodaySpendingHeroSection({
    super.key,
    required this.todaySpending,
    required this.percentageChange,
    required this.isSpendingDown,
  });

  /// Today's total spending amount.
  final double todaySpending;

  /// Percentage change from yesterday (displayed as "X% less/more than yesterday").
  final double percentageChange;

  /// Whether spending is down (true) or up (false) compared to yesterday.
  final bool isSpendingDown;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          // Label — HTML: text-[11px] tracking-[0.2em] uppercase font-bold
          Text(
            "TODAY'S SPENDING",
            style: textStyles.labelSM.copyWith(
              color: colors.textTertiary,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.2, // 0.2em × 11px
            ),
          ),
          const SizedBox(height: 4),

          // Amount — HTML: text-[44px] font-black tracking-tight
          OdometerText(
            value: todaySpending,
            prefix: '\$',
            decimalPlaces: 2,
            style: textStyles.displayXL.copyWith(
              color: colors.textPrimary,
              fontSize: 44,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.0,
              height: 1.1,
            ),
            duration: const Duration(milliseconds: 800),
          ),
          const SizedBox(height: 12), // HTML: mt-3
          // Comparison badge
          _SpendingComparisonBadge(
            percentageChange: percentageChange,
            isSpendingDown: isSpendingDown,
          ),
        ],
      ),
    );
  }
}

class _SpendingComparisonBadge extends StatelessWidget {
  const _SpendingComparisonBadge({
    required this.percentageChange,
    required this.isSpendingDown,
  });

  final double percentageChange;
  final bool isSpendingDown;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Container(
      // HTML: px-4 py-1.5 = 16px horizontal, 6px vertical
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: colors.brandPrimary.withValues(alpha: 0.1),
        borderRadius: context.borderRadius.pill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSpendingDown ? Icons.trending_down : Icons.trending_up,
            color: colors.brandPrimary,
            size: 16,
          ),
          const SizedBox(width: 6), // HTML: gap-1.5
          Text(
            '${percentageChange.toStringAsFixed(0)}% ${isSpendingDown ? 'less' : 'more'} than yesterday',
            style: TextStyle(
              color: colors.brandPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}
