import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onClose,
            icon: Icon(Icons.close, color: colors.textPrimary, size: 28),
          ),
          Text(
            'Add New Transaction',
            style: GoogleFonts.manrope(
              color: colors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onReset,
            child: Text(
              'Reset',
              style: GoogleFonts.manrope(
                color: colors.brandPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
