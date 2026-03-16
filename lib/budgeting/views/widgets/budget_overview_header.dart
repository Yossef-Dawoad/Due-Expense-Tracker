import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/core/common/widgets/app_sliding_segmented_control.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetOverviewHeader extends StatelessWidget {
  const BudgetOverviewHeader({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  final BudgetPeriod selectedPeriod;
  final ValueChanged<BudgetPeriod> onPeriodChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Budget Overview',
                style: textStyles.displayLG.copyWith(
                  fontSize: 30, // mapping 3xl
                  fontWeight: FontWeight.w800, // extrabold
                  letterSpacing: -0.8, // tracking-tight
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'A quick scan of your spending cadence.',
                style: textStyles.caption.copyWith(
                  fontSize: 12, // text-xs
                  fontWeight: FontWeight.w500, // medium
                  color: colors.textTertiary, // text-muted equivalent
                  height: 1.25, // leading-tight
                ),
              ),
            ],
          ),
        ),
        // Use the common animated sliding toggle matching transaction tab aesthetics
        const SizedBox(width: 16),
        SizedBox(
          width:
              140, // Match the previous width of the custom toggle approximately
          child: AppSlidingSegmentedControl<BudgetPeriod>(
            segments: const [
              AppSlidingSegment(value: BudgetPeriod.monthly, label: 'Monthly'),
              AppSlidingSegment(value: BudgetPeriod.weekly, label: 'Weekly'),
            ],
            selectedValue: selectedPeriod,
            onChanged: onPeriodChanged,
            backgroundColor: colors.bgBase, // bg-slate-200/50 replacement
            borderColor: colors.borderDefault, // border-slate-200 equivalent
            thumbColor: colors.bgSurface,
            height:
                36, // Slightly taller/shorter to match layout if needed, let's say 36 for compact
            padding: const EdgeInsets.all(4),
            textStyle: textStyles.tabLabel.copyWith(
              fontSize: 10,
              letterSpacing: 0,
            ),
            selectedTextColor: colors.textPrimary,
            unselectedTextColor: colors.textTertiary,
          ),
        ),
      ],
    );
  }
}
