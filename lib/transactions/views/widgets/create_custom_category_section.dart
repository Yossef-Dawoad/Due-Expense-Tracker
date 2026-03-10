import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/views/widgets/category_icon_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// "Create Custom" form section with category name input and icon picker.
///
/// Displayed below the preset category grid on the Select Category screen.
class CreateCustomCategorySection extends StatelessWidget {
  const CreateCustomCategorySection({
    super.key,
    required this.nameController,
    required this.selectedIconIndex,
    required this.onIconSelected,
    this.nameFocusNode,
  });

  final TextEditingController nameController;
  final ValueListenable<int> selectedIconIndex;
  final ValueChanged<int> onIconSelected;
  final FocusNode? nameFocusNode;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CREATE CUSTOM',
            style: GoogleFonts.manrope(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: colors.textSecondary,
              letterSpacing: 2.2,
            ),
          ),
          SizedBox(height: spacing.s4),
          Container(
            padding: EdgeInsets.all(spacing.s6),
            decoration: BoxDecoration(
              color: colors.bgSurface,
              borderRadius: context.borderRadius.xxl,
              border: Border.all(color: colors.borderDefault),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category name label + input
                _CategoryNameInput(
                  controller: nameController,
                  focusNode: nameFocusNode,
                ),
                SizedBox(height: spacing.s6),
                // Icon picker
                CategoryIconPicker(
                  selectedIndex: selectedIconIndex,
                  onIconSelected: onIconSelected,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Name input field within the Create Custom section.
class _CategoryNameInput extends StatelessWidget {
  const _CategoryNameInput({required this.controller, this.focusNode});

  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CATEGORY NAME',
          style: GoogleFonts.manrope(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: colors.textSecondary,
            letterSpacing: 0.88,
          ),
        ),
        TextField(
          controller: controller,
          focusNode: focusNode,
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'e.g. Subscriptions',
            hintStyle: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.textPlaceholder.withValues(alpha: 0.3),
            ),
            filled: false,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: colors.borderDefault),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colors.borderDefault, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colors.brandPrimary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }
}
