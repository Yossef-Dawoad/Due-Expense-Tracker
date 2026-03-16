import 'package:expancetracker/core/common/widgets/app_flow_header_bar.dart';
import 'package:flutter/material.dart';

/// Top app bar for the Add Transaction screen.
///
/// Displays a close button, title, and reset button.
class AddTransactionAppBar extends StatelessWidget {
  const AddTransactionAppBar({
    super.key,
    required this.onClose,
    required this.onReset,
  });

  final VoidCallback onClose;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return AppFlowHeaderBar(
      title: 'Add New Transaction',
      leadingIcon: Icons.close,
      leadingLabel: 'Close add transaction',
      onLeadingPressed: onClose,
      trailingLabel: 'Reset',
      onTrailingPressed: onReset,
    );
  }
}
