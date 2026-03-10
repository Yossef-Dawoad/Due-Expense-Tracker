import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/preset_categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Horizontally scrollable row of icon options for custom category creation.
///
/// The selected icon is highlighted with a primary border and tinted background.
class CategoryIconPicker extends StatelessWidget {
  const CategoryIconPicker({
    super.key,
    required this.selectedIndex,
    required this.onIconSelected,
  });

  final ValueListenable<int> selectedIndex;
  final ValueChanged<int> onIconSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CHOOSE ICON',
          style: GoogleFonts.manrope(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: colors.textSecondary,
            letterSpacing: 0.88,
          ),
        ),
        SizedBox(height: spacing.s3),
        SizedBox(
          height: spacing.s12,
          child: ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, selected, _) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: kCustomCategoryIcons.length,
                separatorBuilder: (_, __) => SizedBox(width: spacing.s4),
                itemBuilder: (context, index) {
                  return _IconPickerItem(
                    icon: kCustomCategoryIcons[index],
                    isSelected: index == selected,
                    onTap: () => onIconSelected(index),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Single selectable icon item within [CategoryIconPicker].
class _IconPickerItem extends StatelessWidget {
  const _IconPickerItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
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
        width: spacing.s12,
        height: spacing.s12,
        decoration: BoxDecoration(
          color: isSelected
              ? colors.brandPrimary.withValues(alpha: 0.1)
              : colors.bgSurfaceSecondary,
          borderRadius: context.borderRadius.iconContainer,
          border: Border.all(
            color: isSelected ? colors.brandPrimary : colors.borderDefault,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Icon(
          icon,
          color: isSelected ? colors.brandPrimary : colors.textSecondary,
        ),
      ),
    );
  }
}
