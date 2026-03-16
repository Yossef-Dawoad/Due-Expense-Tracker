import 'package:expancetracker/budgeting/views/widgets/budget_category_progress_bar.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A card displaying a budget overview, including remaining balance, limit, and a progress bar.
/// HTML ref: px-6 mb-5 wrapper, inside: bg-white border border-border-light rounded-[20px] p-5 shadow-sm
class BudgetOverviewCard extends StatelessWidget {
  const BudgetOverviewCard({
    super.key,
    required this.limit,
    required this.remaining,
    required this.month,
  });

  final double limit;
  final double remaining;
  final String month;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    final spent = limit - remaining;
    final percentageUsed = (limit > 0) ? (spent / limit).clamp(0.0, 1.0) : 0.0;
    final percentageInt = (percentageUsed * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(16), // More compact padding
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(20), // rounded-[20px]
        border: Border.all(color: colors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 1), // shadow-sm approx
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HTML: text-[15px] font-black
                    Text(
                      '$month Budget',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900, // black
                        color: colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2), // HTML: mt-0.5
                    // HTML: text-[12px] font-bold text-text-muted
                    Text(
                      '12 days left', // Note: could be dynamic, but static in mock
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700, // bold
                        color: colors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              // Icon container - HTML: size-10 rounded-full bg-primary/10
              Container(
                width: 40, // size-10
                height: 40,
                decoration: BoxDecoration(
                  color: colors.brandPrimary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: colors.brandPrimary,
                  size: 20, // text-[20px] (default icon size approx)
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // HTML: mb-4 from flex container
          // Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HTML: text-[11px] font-extrabold text-text-muted uppercase tracking-wider mb-0.5
                  Text(
                    'REMAINING',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800, // extrabold
                      color: colors.textTertiary,
                      letterSpacing: 0.55, // tracking-wider
                    ),
                  ),
                  const SizedBox(height: 2), // HTML: mb-0.5
                  // HTML: text-[24px] font-black leading-none text-text-main
                  Text(
                    '\$${remaining.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '')}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900, // black
                      color: colors.textPrimary,
                      height: 1.0, // leading-none
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // HTML: text-[12px] font-bold text-text-muted mb-1
                  Text(
                    'of \$${limit.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700, // bold
                      color: colors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 4), // HTML: mb-1
                  // HTML: text-[12px] font-extrabold text-primary
                  Text(
                    '$percentageInt% used',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800, // extrabold
                      color: colors.brandPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16), // HTML: mt-3
          BudgetCategoryProgressBar(
            spentFraction: percentageUsed,
            remainingLabel: 'REMAINING',
            spentLabel: 'SPENT',
          ),
        ],
      ),
    );
  }
}
