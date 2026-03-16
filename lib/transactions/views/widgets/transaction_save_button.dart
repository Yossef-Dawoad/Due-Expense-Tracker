import 'package:expancetracker/core/common/widgets/app_bottom_action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Floating bottom save button with loading indicator.
///
/// Shows a [CircularProgressIndicator] while saving, otherwise displays
/// the "Save Transaction" label with a check icon.
class TransactionSaveButton extends StatelessWidget {
  const TransactionSaveButton({
    super.key,
    required this.isSaving,
    required this.onPressed,
  });

  final ValueListenable<bool> isSaving;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSaving,
      builder: (context, saving, _) {
        return AppBottomActionButton(
          label: 'Save Transaction',
          icon: Icons.check_circle_outline,
          isLoading: saving,
          onPressed: onPressed,
        );
      },
    );
  }
}
