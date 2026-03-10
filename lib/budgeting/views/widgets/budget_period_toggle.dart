import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/budgeting/viewmodels/budgeting_view_model.dart';

/// Atom: Monthly / Weekly segmented toggle control.
class BudgetPeriodToggle extends StatelessWidget {
  const BudgetPeriodToggle({
    super.key,
    required this.selectedPeriod,
    required this.onToggle,
  });

  final BudgetPeriod selectedPeriod;
  final ValueChanged<BudgetPeriod> onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final borderRadius = context.borderRadius;

    return Container(
      padding: EdgeInsets.all(spacing.s1), // 4px
      decoration: BoxDecoration(
        color: colors.bgBase,
        borderRadius: borderRadius.xl,
      ),
      child: Row(
        children: [
          _PeriodTab(
            label: 'Monthly',
            isSelected: selectedPeriod == BudgetPeriod.monthly,
            onTap: () => onToggle(BudgetPeriod.monthly),
          ),
          _PeriodTab(
            label: 'Weekly',
            isSelected: selectedPeriod == BudgetPeriod.weekly,
            onTap: () => onToggle(BudgetPeriod.weekly),
          ),
        ],
      ),
    );
  }
}

class _PeriodTab extends StatelessWidget {
  const _PeriodTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final shadows = context.shadows;
    final borderRadius = context.borderRadius;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? colors.bgSurface : Colors.transparent,
            borderRadius: borderRadius.sm,
            boxShadow: isSelected ? shadows.elevation1 : [],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: textStyles.bodySM.copyWith(
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              color: isSelected ? colors.textPrimary : colors.brandPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
