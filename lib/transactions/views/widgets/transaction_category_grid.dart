import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/preset_categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Grid of selectable transaction categories.
///
/// Shows the preset list ([kPresetCategories]) as tiles. Selecting a preset
/// will insert it into the database (if not already present) by calling
/// [onPresetSelected]. Already-persisted categories are detected by comparing
/// names so the same preset is never duplicated.
class TransactionCategoryGrid extends StatelessWidget {
  const TransactionCategoryGrid({
    super.key,
    required this.selectedCategory,
    required this.persistedCategories,
    required this.onPresetSelected,
    this.onOtherSelected,
  });

  /// The currently active selection (may come from the DB after lazy insert).
  final ValueListenable<CategoryModel?> selectedCategory;

  /// The list of categories already in the local database for deduplication
  /// checking. Used to mark which presets are already persisted.
  final ValueListenable<List<CategoryModel>> persistedCategories;

  /// Called when the user taps a preset tile; should upsert it into the DB
  /// and update [selectedCategory].
  final ValueChanged<PresetCategory> onPresetSelected;

  /// Called when the user taps the "Other" preset tile.
  /// If null, "Other" behaves like any other preset.
  final VoidCallback? onOtherSelected;

  @override
  Widget build(BuildContext context) {
    const itemStagger = Duration(milliseconds: 50);
    const baseDelay = Duration(milliseconds: 100);

    return ValueListenableBuilder<CategoryModel?>(
      valueListenable: selectedCategory,
      builder: (context, selected, _) {
        return ValueListenableBuilder<List<CategoryModel>>(
          valueListenable: persistedCategories,
          builder: (context, persisted, _) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5,
              ),
              itemCount: kPresetCategories.length,
              itemBuilder: (context, index) {
                PresetCategory preset = kPresetCategories[index];
                final isOtherTile = index == kPresetCategories.length - 1;

                if (isOtherTile) {
                  final isSelectedInFirst7 =
                      selected != null &&
                      kPresetCategories
                          .sublist(0, 7)
                          .any(
                            (p) =>
                                p.name.toLowerCase() ==
                                selected.name.toLowerCase(),
                          );

                  if (selected != null && !isSelectedInFirst7) {
                    final iconCode =
                        int.tryParse(selected.icon) ?? Icons.category.codePoint;
                    final colorVal =
                        int.tryParse(selected.color, radix: 16) ?? 0xFFB0B0B0;
                    preset = PresetCategory(
                      name: selected.name,
                      icon: IconData(iconCode, fontFamily: 'MaterialIcons'),
                      color: Color(colorVal),
                    );
                  }
                }

                // Determine if this preset is the currently selected item.
                final isSelected =
                    selected != null &&
                    selected.name.toLowerCase() == preset.name.toLowerCase();

                return FadeInAnimation(
                  delay: baseDelay + (itemStagger * index),
                  duration: AnimationDurations.medium,
                  child: SlideInAnimation(
                    delay: baseDelay + (itemStagger * index),
                    duration: AnimationDurations.medium,
                    beginOffset: const Offset(0, 0.15),
                    child: _PresetCategoryItem(
                      preset: preset,
                      isSelected: isSelected,
                      onTap: () {
                        if (isOtherTile && onOtherSelected != null) {
                          onOtherSelected!();
                        } else {
                          onPresetSelected(preset);
                        }
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

/// A single preset category tile within [TransactionCategoryGrid].
class _PresetCategoryItem extends StatelessWidget {
  const _PresetCategoryItem({
    required this.preset,
    required this.isSelected,
    required this.onTap,
  });

  final PresetCategory preset;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final tileColor = isSelected
        ? preset.color.withValues(alpha: 0.18)
        : colors.bgSurface;
    final borderColor = isSelected ? preset.color : colors.borderDefault;
    final iconColor = isSelected ? preset.color : colors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            Icon(preset.icon, color: iconColor, size: 26),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                preset.name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  color: colors.textPrimary,
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
