import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Square tile displaying a preset category icon and name.
///
/// Two visual states: selected (green border + icon) and unselected (grey).
class CategoryGridTile extends StatelessWidget {
  const CategoryGridTile({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: context.borderRadius.lg,
          border: Border.all(
            color: isSelected ? colors.brandPrimary : colors.borderDefault,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconData(
                int.tryParse(category.icon) ?? Icons.category.codePoint,
                fontFamily: 'MaterialIcons',
              ),
              size: 32,
              color: isSelected ? colors.brandPrimary : colors.textSecondary,
            ),
            SizedBox(height: spacing.s2),
            Text(
              category.name,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
