import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Rounded search input with leading search icon for filtering categories.
class CategorySearchBar extends StatelessWidget {
  const CategorySearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.s4,
        vertical: spacing.s2,
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Search categories...',
          hintStyle: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.textPlaceholder,
          ),
          prefixIcon: Icon(Icons.search, color: colors.textSecondary),
          filled: true,
          fillColor: colors.bgSurfaceSecondary,
          border: OutlineInputBorder(
            borderRadius: context.borderRadius.lg,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: context.borderRadius.lg,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: context.borderRadius.lg,
            borderSide: BorderSide(
              color: colors.brandPrimary.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: spacing.s3,
            horizontal: spacing.s4,
          ),
        ),
      ),
    );
  }
}
