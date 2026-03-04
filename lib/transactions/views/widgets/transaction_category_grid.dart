import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Grid of selectable transaction categories with staggered entrance animations.
class TransactionCategoryGrid extends StatelessWidget {
  const TransactionCategoryGrid({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final ValueListenable<CategoryModel?> selectedCategory;
  final ValueChanged<CategoryModel> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    // Mock categories for UI implementation
    final categories = [
      (name: 'Food', icon: Icons.restaurant),
      (name: 'Shopping', icon: Icons.shopping_bag),
      (name: 'Transport', icon: Icons.directions_car),
      (name: 'Health', icon: Icons.monitor_heart),
      (name: 'Rent', icon: Icons.house),
      (name: 'Other', icon: Icons.more_horiz),
    ];

    const itemStagger = Duration(milliseconds: 50);
    const baseDelay = Duration(milliseconds: 100);

    return ValueListenableBuilder<CategoryModel?>(
      valueListenable: selectedCategory,
      builder: (context, selected, _) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            final isSelected = selected?.name == cat.name;

            return FadeInAnimation(
              delay: baseDelay + (itemStagger * index),
              duration: AnimationDurations.medium,
              child: SlideInAnimation(
                delay: baseDelay + (itemStagger * index),
                duration: AnimationDurations.medium,
                beginOffset: const Offset(0, 0.15),
                child: _CategoryGridItem(
                  name: cat.name,
                  icon: cat.icon,
                  isSelected: isSelected,
                  onTap: () {
                    onCategorySelected(
                      CategoryModel(
                        id: index.toString(),
                        userId: '',
                        name: cat.name,
                        icon: cat.icon.codePoint.toString(),
                        color: Colors.blue.toARGB32().toRadixString(16),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// A single category tile within [TransactionCategoryGrid].
class _CategoryGridItem extends StatelessWidget {
  const _CategoryGridItem({
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? colors.brandPrimary : colors.borderDefault,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? colors.brandPrimary : colors.textSecondary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              name,
              style: GoogleFonts.manrope(
                color: colors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
