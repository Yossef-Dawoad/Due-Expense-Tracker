import 'package:expancetracker/animation/widgets/odometer_text.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BalanceHeader extends StatelessWidget {
  final double totalBalance;
  final double balanceChangePercent;

  const BalanceHeader({
    super.key,
    required this.totalBalance,
    required this.balanceChangePercent,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;
    final isPositive = balanceChangePercent >= 0;
    final trendColor = isPositive
        ? colors.semanticPositive
        : colors.semanticNegative;

    return Column(
      children: [
        Text(
          'TOTAL BALANCE',
          style: textStyles.labelSM.copyWith(
            color: colors.textTertiary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
          ),
        ),
        SizedBox(height: spacing.s2),
        OdometerText(
          value: totalBalance,
          prefix: '\$',
          decimalPlaces: 2,
          style: textStyles.displayXL.copyWith(
            fontWeight: FontWeight.w900,
            color: colors.textPrimary,
            letterSpacing: -1.0,
          ),
        ),
        SizedBox(height: spacing.s4),
        AppPillBadge(
          icon: isPositive ? Icons.trending_up : Icons.trending_down,
          label:
              '${isPositive ? '+' : ''}${balanceChangePercent.toStringAsFixed(1)}% vs last month',
          textColor: trendColor,
          backgroundColor: trendColor.withValues(alpha: 0.10),
          borderColor: trendColor.withValues(alpha: 0.18),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
      ],
    );
  }
}
