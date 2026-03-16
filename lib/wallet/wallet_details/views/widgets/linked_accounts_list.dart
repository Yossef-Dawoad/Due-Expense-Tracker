import 'package:expancetracker/animation/widgets/odometer_text.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/wallet/data/models/account.dart';
import 'package:flutter/material.dart';

class LinkedAccountsList extends StatelessWidget {
  final List<Account> accounts;

  const LinkedAccountsList({super.key, required this.accounts});

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(
          title: 'Linked Accounts',
          subtitle:
              'Connected sources that contribute to your total wallet picture.',
          trailing: Container(
            decoration: BoxDecoration(
              color: colors.bgSurface,
              shape: BoxShape.circle,
              border: Border.all(color: colors.borderLight),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: colors.textSecondary),
              constraints: const BoxConstraints.tightFor(width: 36, height: 36),
              padding: EdgeInsets.zero,
              iconSize: 20,
            ),
          ),
        ),
        SizedBox(height: spacing.s4),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: accounts.length,
          separatorBuilder: (context, index) => SizedBox(height: spacing.s3),
          itemBuilder: (context, index) {
            final account = accounts[index];
            final accountColor = _getAccountColor(account.type);
            final accountIcon = _getAccountIcon(account.type);

            return AppSurfaceCard(
              padding: const EdgeInsets.all(16),
              borderRadius: context.borderRadius.xl,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
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
                          style: context.textStyles.bodyMD.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          account.type,
                          style: context.textStyles.caption.copyWith(
                            color: colors.textTertiary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OdometerText(
                        value: account.balance,
                        prefix: '\$',
                        decimalPlaces: 2,
                        style: context.textStyles.headingMD.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (!account.isArchived)
                        AppPillBadge(
                          label: 'Active',
                          textColor: colors.semanticPositive,
                          backgroundColor: colors.semanticPositive.withValues(
                            alpha: 0.10,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                        )
                      else
                        AppPillBadge(
                          label: 'Archived',
                          textColor: colors.textSecondary,
                          backgroundColor: colors.bgBase,
                          borderColor: colors.borderLight,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
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

  Color _getAccountColor(String type) {
    return switch (type.toLowerCase()) {
      'savings' => const Color(0xFF10B981),
      'checking' => const Color(0xFF3B82F6),
      'credit' => const Color(0xFFF59E0B),
      'investment' => const Color(0xFF8B5CF6),
      _ => const Color(0xFF6B7280),
    };
  }

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
