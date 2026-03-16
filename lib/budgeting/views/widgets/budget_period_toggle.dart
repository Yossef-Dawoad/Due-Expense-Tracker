import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/core/common/widgets/app_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

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
    return AppSlidingSegmentedControl<BudgetPeriod>(
      segments: const [
        AppSlidingSegment(value: BudgetPeriod.monthly, label: 'Monthly'),
        AppSlidingSegment(value: BudgetPeriod.weekly, label: 'Weekly'),
      ],
      selectedValue: selectedPeriod,
      onChanged: onToggle,
    );
  }
}
