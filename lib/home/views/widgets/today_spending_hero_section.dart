import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/home/views/widgets/day_selector.dart';
import 'package:flutter/material.dart';

/// Centered hero section displaying today's total spending amount
/// with a comparison badge showing percentage change from yesterday.
class TodaySpendingHeroSection extends StatelessWidget {
  const TodaySpendingHeroSection({
    super.key,
    required this.remaining,
    required this.todaySpending,
    required this.percentageChange,
    required this.isSpendingDown,
  });

  /// The user's total active balance.
  final double remaining;

  /// Today's total spending amount.
  final double todaySpending;

  /// Percentage change from yesterday.
  final double percentageChange;

  /// Whether spending is down.
  final bool isSpendingDown;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 24),
      child: Column(
        children: [
          // Day Selector
          const DaySelector(),
          const SizedBox(height: 24),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Remaining Balance
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REMAINING',
                      style: textStyles.labelSM.copyWith(
                        color: colors.textTertiary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    OdometerText(
                      value: remaining,
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
                    const SizedBox(height: 12),
                    _SpendingComparisonBadge(
                      percentageChange: percentageChange,
                      isSpendingDown: isSpendingDown,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right: Today's Spending
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TODAY'S\nSPENDING",
                      style: textStyles.labelSM.copyWith(
                        color: colors.textTertiary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 14),
                    OdometerText(
                      value: todaySpending,
                      prefix: '\$',
                      decimalPlaces: 2,
                      style: textStyles.headingMD.copyWith(
                        color: colors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                        height: 1.1,
                      ),
                      duration: const Duration(milliseconds: 800),
                    ),
                  ],
                ),
              ),
            ],
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
    return RippleAnimation(
      color: colors.brandPrimary,
      borderWidth: 2.0,
      maxSpread: 12.0,
      child: Material(
        color: colors.brandPrimary.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(
            color: colors.brandPrimary.withValues(alpha: 0.2),
          ),
        ),
        child: InkWell(
          onTap: () {
            locator<RouterService>().push<void>(Routes.walletDetails);
          },
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ), // px-4 py-1.5
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
          ),
        ),
      ),
    );
  }
}
