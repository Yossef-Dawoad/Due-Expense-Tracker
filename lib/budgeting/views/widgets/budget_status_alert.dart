import 'package:expancetracker/core/common/widgets/inline_status_alert_banner.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetStatusAlert extends StatelessWidget {
  const BudgetStatusAlert({super.key, required this.atRiskCount});

  final int atRiskCount;

  @override
  Widget build(BuildContext context) {
    if (atRiskCount == 0) return const SizedBox.shrink();

    final colors = context.kitColors;

    return InlineStatusAlertBanner(
      leadingWidget: Container(
        width: 20, // w-5
        height: 14, // h-3.5
        decoration: BoxDecoration(
          color: colors.semanticNegative.withValues(
            alpha: 0.12,
          ), // brand-red-light
          border: Border.all(
            color: colors.semanticNegative.withValues(alpha: 0.2),
          ), // red-200
          borderRadius: BorderRadius.circular(999),
        ),
        alignment: Alignment.center,
        child: Container(
          width: 10, // w-2.5
          height: 4, // h-1
          decoration: BoxDecoration(
            color: colors.semanticNegative, // brand-red
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
      content: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$atRiskCount budget${atRiskCount == 1 ? ' is' : 's are'} ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary, // slate-900 equivalent
              ),
            ),
            TextSpan(
              text: 'close to the limit.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: colors.textTertiary, // slate-600 equivalent
              ),
            ),
          ],
        ),
        style: const TextStyle(
          fontSize: 14,
          height: 1.4, // leading-tight
        ),
      ),
    );
  }
}
