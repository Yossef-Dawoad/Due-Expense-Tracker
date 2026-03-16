import 'package:expancetracker/animation/widgets/odometer_text.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class FinancialSummaryCards extends StatelessWidget {
  final double availableBalance;
  final double totalLiabilities;

  const FinancialSummaryCards({
    super.key,
    required this.availableBalance,
    required this.totalLiabilities,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Row(
      children: [
        Expanded(
          child: SummaryCard(
            title: 'AVAILABLE BALANCE',
            amount: availableBalance,
            icon: Icons.account_balance_wallet,
            iconColor: const Color(0xff059669),
            iconBg: const Color(0xffD1FAE5),
          ),
        ),
        SizedBox(width: spacing.s4),
        Expanded(
          child: SummaryCard(
            title: 'TOTAL LIABILITIES',
            amount: totalLiabilities,
            icon: Icons.credit_card,
            iconColor: const Color(0xffE11D48),
            iconBg: const Color(0xffFFE4E6),
          ),
        ),
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return AppSurfaceCard(
      height: 160,
      padding: const EdgeInsets.all(20),
      borderRadius: context.borderRadius.xxl,
      backgroundColor: colors.bgSurface,
      borderColor: colors.borderDefault,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.02),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textStyles.labelSM.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              OdometerText(
                value: amount,
                prefix: '\$',
                decimalPlaces: 2,
                style: textStyles.headingLG.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
