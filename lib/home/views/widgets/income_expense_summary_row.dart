import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// Two side-by-side bordered cards showing income and expenses.
/// HTML ref: flex gap-4, each card: bg-white border-border-light rounded-2xl p-4 shadow-sm
class IncomeExpenseSummaryRow extends StatelessWidget {
  const IncomeExpenseSummaryRow({
    super.key,
    required this.income,
    required this.expenses,
  });

  final double income;
  final double expenses;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Row(
      children: [
        Expanded(
          child: _SummaryMetricTile(
            label: 'INCOME',
            value: income,
            icon: Icons.arrow_downward,
            accentColor: const Color(0xFF059669), // text-emerald-600
            startDelay: const Duration(milliseconds: 180),
          ),
        ),
        const SizedBox(width: 12), // tighter gap
        Expanded(
          child: _SummaryMetricTile(
            label: 'EXPENSES',
            value: expenses,
            icon: Icons.arrow_upward,
            accentColor: colors.semanticNegative,
            startDelay: const Duration(milliseconds: 280),
          ),
        ),
      ],
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
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: context.borderRadius.iconContainer,
                ),
                child: Icon(icon, color: accentColor, size: 16),
              ),
              SizedBox(width: spacing.s2),
              Expanded(
                child: Text(
                  label,
                  style: textStyles.labelSM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.s2),
          OdometerText(
            value: value,
            prefix: '\$',
            decimalPlaces: 0,
            startDelay: startDelay,
            digitStagger: const Duration(milliseconds: 40),
            style: textStyles.headingMD.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w900,
              fontSize: 20, // 20px for compactness
            ),
          ),
        ],
      ),
    );
  }
}
