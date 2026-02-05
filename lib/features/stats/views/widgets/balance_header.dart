import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPositive = balanceChangePercent >= 0;

    return Column(
      children: [
        Text(
          'TOTAL BALANCE',
          style: theme.textTheme.labelMedium?.copyWith(
            color: Colors
                .grey, // Or use a specific refined color from palette if exposed
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '\$${totalBalance.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
          style: theme.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isPositive
                ? const Color(0xffECFDF5)
                : const Color(0xffFFF1F2), // Light green/red
            border: Border.all(
              color: isPositive
                  ? const Color(0xffD1FAE5)
                  : const Color(0xffFECDD3),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive
                    ? const Color(0xff059669)
                    : const Color(0xffE11D48),
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '${isPositive ? '+' : ''}${balanceChangePercent.toString()}% vs last month',
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: isPositive
                      ? const Color(0xff059669)
                      : const Color(0xffE11D48),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
