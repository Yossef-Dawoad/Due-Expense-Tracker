import 'package:expancetracker/wallet/data/models/account.dart';
import 'package:flutter/material.dart';

class LinkedAccountsList extends StatelessWidget {
  final List<Account> accounts;

  const LinkedAccountsList({super.key, required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Linked Accounts',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffF1F5F9),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.black54),
                constraints: const BoxConstraints.tightFor(
                  width: 36,
                  height: 36,
                ),
                padding: EdgeInsets.zero,
                iconSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: accounts.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final account = accounts[index];
            // Use a default icon and color based on account type
            final accountColor = _getAccountColor(account.type);
            final accountIcon = _getAccountIcon(account.type);

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: accountColor,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: accountColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(accountIcon, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          account.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          account.type,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${account.balance.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (!account.isArchived)
                        const Text(
                          'Active',
                          style: TextStyle(
                            color: Color(0xff10B981),
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        )
                      else
                        Text(
                          'Archived',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  /// Maps account type to a display color.
  Color _getAccountColor(String type) {
    return switch (type.toLowerCase()) {
      'savings' => const Color(0xFF10B981),
      'checking' => const Color(0xFF3B82F6),
      'credit' => const Color(0xFFF59E0B),
      'investment' => const Color(0xFF8B5CF6),
      _ => const Color(0xFF6B7280),
    };
  }

  /// Maps account type to a display icon.
  IconData _getAccountIcon(String type) {
    return switch (type.toLowerCase()) {
      'savings' => Icons.savings,
      'checking' => Icons.account_balance,
      'credit' => Icons.credit_card,
      'investment' => Icons.trending_up,
      _ => Icons.account_balance_wallet,
    };
  }
}
