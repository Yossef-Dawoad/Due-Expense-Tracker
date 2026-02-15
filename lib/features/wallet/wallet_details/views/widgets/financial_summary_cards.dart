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
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            context,
            title: 'AVAILABLE BALANCE',
            amount: availableBalance,
            icon: Icons.account_balance_wallet,
            iconColor: const Color(0xff059669),
            iconBg: const Color(0xffD1FAE5),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildCard(
            context,
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

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required double amount,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
  }) {
    // Glassmorphism effect logic could be added here if we had the background image.
    // For now using white as per "background-light" implementation in design context
    // but the screenshot implies a slight backdrop or just clean cards.
    // The design HTML used .glass-card { background: rgba(255, 255, 255, 0.6); ... }

    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: 0.8,
        ), // Slight transparency for possible glass feel
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
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
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
