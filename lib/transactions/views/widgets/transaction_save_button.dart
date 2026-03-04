import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final colors = context.kitColors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.brandPrimary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.brandPrimary,
            foregroundColor: colors.textOnPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: isSaving,
            builder: (context, saving, _) {
              if (saving) {
                return SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: colors.textOnPrimary,
                    strokeWidth: 2,
                  ),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Save Transaction',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.check_circle_outline, size: 24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
