import 'package:expancetracker/core/common/widgets/animated_limit_progress_bar.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class MonthlyBudgetSnapshotCard extends StatelessWidget {
  const MonthlyBudgetSnapshotCard({
    super.key,
    required this.title,
    required this.supportingText,
    required this.remainingAmount,
    required this.totalBudget,
    this.icon = Icons.account_balance_wallet_outlined,
  });

  final String title;
  final String supportingText;
  final double remainingAmount;
  final double totalBudget;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spentAmount = totalBudget - remainingAmount;
    final spentFraction = totalBudget > 0
        ? (spentAmount / totalBudget).clamp(0.0, 1.0)
        : 0.0;
    final spentPercentage = (spentFraction * 100).round();

    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      borderColor: colors.borderLight,
      borderRadius: context.borderRadius.xl,
      boxShadow: context.shadows.elevation1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      supportingText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: colors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              ColoredFeatureIcon(
                icon: icon,
                baseColor: colors.brandPrimary,
                containerSize: 40,
                borderRadius: 999,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REMAINING',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: colors.textTertiary,
                      letterSpacing: 0.55,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatCurrency(remainingAmount),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: colors.textPrimary,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'of ${_formatCurrency(totalBudget, decimals: 0)}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: colors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$spentPercentage% used',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: colors.brandPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedLimitProgressBar(
            fraction: spentFraction,
            barColor: colors.brandPrimary,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REMAINING',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: colors.textTertiary,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'SPENT',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: colors.textPrimary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _formatCurrency(double value, {int decimals = 2}) {
  final formatted = value.toStringAsFixed(decimals);
  return r'$' + formatted.replaceFirst(RegExp(r'\.00$'), '');
}
