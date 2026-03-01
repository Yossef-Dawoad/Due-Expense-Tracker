import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class ExpenseSummaryCard extends StatelessWidget {
  final double totalBalance;
  final double income;
  final double expenses;

  const ExpenseSummaryCard({
    super.key,
    required this.totalBalance,
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        // Using a gradient that aligns with the "Deep Green/Purple" theme or keeping the one from V2 if users liked it.
        // The V2 had: blue -> purple -> dark green.
        // Let's refine it to match the new Palette slightly better or keep it premium dark.
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.kitColors.brandPrimaryLight, // Lighter green
            context.kitColors.brandPrimaryDark, // Darker green
          ],
        ),
        boxShadow: context.shadows.elevation3,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Balance',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${totalBalance.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildIndicator(
                  context,
                  title: 'INCOME',
                  value: '\$${income.toStringAsFixed(2)}',
                  icon: Icons.arrow_upward,
                  color: const Color(0xff059669), // Emerald
                  bgColor: const Color(0xffECFDF5),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildIndicator(
                  context,
                  title: 'EXPENSES',
                  value: '\$${expenses.toStringAsFixed(2)}',
                  icon: Icons.arrow_downward,
                  color: const Color(0xffE11D48), // Rose
                  bgColor: const Color(0xffFFE4E6), // Rose light
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white, // Pop the icon
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 14),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
