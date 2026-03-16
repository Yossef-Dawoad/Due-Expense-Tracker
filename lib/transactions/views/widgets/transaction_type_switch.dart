import 'package:expancetracker/core/common/widgets/app_sliding_segmented_control.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Segmented control for switching between Expense and Income transaction types.
///
/// Uses a [Stack] with an [AnimatedPositioned] sliding pill indicator so the
/// selected-tab background physically slides from one option to the other
/// (iOS-style), instead of each segment independently fading its own
/// background in/out which reads as a jarring double-blink.
class TransactionTypeSwitch extends StatelessWidget {
  const TransactionTypeSwitch({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  final ValueListenable<TransactionType> selectedType;
  final ValueChanged<TransactionType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ValueListenableBuilder<TransactionType>(
        valueListenable: selectedType,
        builder: (context, type, _) {
          return AppSlidingSegmentedControl<TransactionType>(
            segments: const [
              AppSlidingSegment(
                value: TransactionType.expense,
                label: 'Expense',
              ),
              AppSlidingSegment(value: TransactionType.income, label: 'Income'),
            ],
            selectedValue: type,
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}
