import 'package:expancetracker/animation/animation.dart';
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
    return Row(
      children: [
        Expanded(
          child: _SummaryMiniCard(
            label: 'INCOME',
            amount: income,
            icon: Icons.arrow_downward,
            valueColor: const Color(0xFF10B981), // Emerald-500
            isIncome: true,
          ),
        ),
        const SizedBox(width: 16), // HTML: gap-4
        Expanded(
          child: _SummaryMiniCard(
            label: 'EXPENSES',
            amount: expenses,
            icon: Icons.arrow_upward,
            valueColor: const Color(0xFFFB7185), // Rose-400
            isIncome: false,
          ),
        ),
      ],
    );
  }
}

class _SummaryMiniCard extends StatelessWidget {
  const _SummaryMiniCard({
    required this.label,
    required this.amount,
    required this.icon,
    required this.valueColor,
    required this.isIncome,
  });

  final String label;
  final double amount;
  final IconData icon;
  final Color valueColor;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return ScaleFeedback(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ), // HTML: p-4
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: context.borderRadius.xxl,
          border: Border.all(color: colors.borderDefault),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HTML: text-[10px] font-bold uppercase tracking-widest mb-1
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: colors.textTertiary,
                letterSpacing: 1.6, // tracking-widest ≈ 0.16em × 10px
              ),
            ),
            const SizedBox(height: 4), // HTML: mb-1
            // HTML: flex items-center gap-1
            Row(
              children: [
                Icon(icon, color: valueColor, size: 18),
                const SizedBox(width: 4), // HTML: gap-1
                Flexible(
                  child: OdometerText(
                    value: amount,
                    prefix: '\$',
                    decimalPlaces: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: isIncome ? valueColor : colors.textPrimary,
                    ),
                    duration: const Duration(milliseconds: 800),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
