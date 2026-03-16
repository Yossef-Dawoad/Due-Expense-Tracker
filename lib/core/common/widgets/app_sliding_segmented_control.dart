import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSlidingSegment<T> {
  const AppSlidingSegment({required this.value, required this.label});

  final T value;
  final String label;
}

class AppSlidingSegmentedControl<T> extends StatelessWidget {
  const AppSlidingSegmentedControl({
    super.key,
    required this.segments,
    required this.selectedValue,
    required this.onChanged,
    this.height = 48,
    this.backgroundColor,
    this.thumbColor,
    this.borderColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.textStyle,
    this.padding = const EdgeInsets.all(4),
  });

  final List<AppSlidingSegment<T>> segments;
  final T selectedValue;
  final ValueChanged<T> onChanged;
  final double height;
  final Color? backgroundColor;
  final Color? thumbColor;
  final Color? borderColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.brandPrimary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final selectedIndex = segments.indexWhere(
            (segment) => segment.value == selectedValue,
          );
          final safeIndex = selectedIndex < 0 ? 0 : selectedIndex;
          final pillWidth = constraints.maxWidth / segments.length;
          final pillLeft = pillWidth * safeIndex;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 280),
                curve: AnimationCurves.decelerate,
                left: pillLeft,
                top: 0,
                bottom: 0,
                width: pillWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: thumbColor ?? colors.bgSurface,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.07),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: segments
                    .map(
                      (segment) => Expanded(
                        child: _AppSlidingSegmentTab(
                          label: segment.label,
                          isSelected: segment.value == selectedValue,
                          onTap: () => onChanged(segment.value),
                          selectedTextColor: selectedTextColor,
                          unselectedTextColor: unselectedTextColor,
                          baseStyle: textStyle,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AppSlidingSegmentTab extends StatelessWidget {
  const _AppSlidingSegmentTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.baseStyle,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return ScaleFeedback(
      onTap: onTap,
      minScale: 0.96,
      duration: AnimationDurations.rapid,
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 220),
          curve: AnimationCurves.standard,
          style: (baseStyle ?? GoogleFonts.manrope(fontSize: 14)).copyWith(
            color: isSelected
                ? (selectedTextColor ?? colors.textPrimary)
                : (unselectedTextColor ?? colors.textTertiary),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
