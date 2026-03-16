import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/home/views/widgets/day_selector.dart';
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
      padding: const EdgeInsets.only(top: 0, bottom: 24),
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
          const SizedBox(height: 16), // HTML: mb-4 from title to DaySelector
          // Day Selector
          const DaySelector(),
          const SizedBox(height: 24), // HTML: mb-6 from DaySelector to Price
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
          const SizedBox(height: 10), // HTML: mt-2.5
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

    // HTML: mt-2.5 flex items-center gap-1.5 bg-primary/10 px-4 py-1.5 rounded-full border border-primary/20
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ), // px-4 py-1.5
      decoration: BoxDecoration(
        color: colors.brandPrimary.withValues(alpha: 0.1), // bg-primary/10
        borderRadius: BorderRadius.circular(999), // rounded-full
        border: Border.all(
          color: colors.brandPrimary.withValues(
            alpha: 0.2,
          ), // border-primary/20
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // HTML: text-primary text-[16px] font-bold
          Icon(
            isSpendingDown ? Icons.trending_down : Icons.trending_up,
            color: colors.brandPrimary,
            size: 16, // text-[16px]
          ),
          const SizedBox(width: 6), // gap-1.5
          // HTML: text-primary text-[12px] font-extrabold tracking-tight
          Text(
            '${percentageChange.toStringAsFixed(0)}% ${isSpendingDown ? 'less' : 'more'} than yesterday',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800, // extrabold
              letterSpacing: -0.5, // tracking-tight roughly
              color: colors.brandPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
