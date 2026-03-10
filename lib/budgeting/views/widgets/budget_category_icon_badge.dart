import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';

/// Atom: A 40×40 icon badge with a rounded-lg border, light green background,
/// and a green icon — matching the HTML `w-10 h-10 rounded-lg` icon containers.
class BudgetCategoryIconBadge extends StatelessWidget {
  const BudgetCategoryIconBadge({super.key, required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final borderRadius = context.borderRadius;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colors.brandPrimary.withValues(alpha: 0.05),
        border: Border.all(color: colors.brandPrimary.withValues(alpha: 0.20)),
        borderRadius: borderRadius.iconContainer,
      ),
      child: Icon(iconData, color: colors.brandPrimary, size: 20),
    );
  }
}
