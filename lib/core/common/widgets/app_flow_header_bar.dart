import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFlowHeaderBar extends StatelessWidget {
  const AppFlowHeaderBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.leadingLabel,
    required this.onLeadingPressed,
    this.trailingLabel,
    this.onTrailingPressed,
  });

  final String title;
  final IconData leadingIcon;
  final String leadingLabel;
  final VoidCallback onLeadingPressed;
  final String? trailingLabel;
  final VoidCallback? onTrailingPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final trailing = trailingLabel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Semantics(
            label: leadingLabel,
            button: true,
            child: IconButton(
              onPressed: onLeadingPressed,
              icon: Icon(leadingIcon, color: colors.textPrimary, size: 28),
            ),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                color: colors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing == null
              ? const SizedBox(width: 72)
              : TextButton(
                  onPressed: onTrailingPressed,
                  child: Text(
                    trailing,
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
