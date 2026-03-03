import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int count;
  final double dotHeight;
  final PageController controller;

  const Indicator({
    super.key,
    required this.controller,
    required this.count,
    required this.dotHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Safe controller page fallback for initial load frame
        final pageValue =
            controller.hasClients && controller.position.haveDimensions
            ? (controller.page ?? 0.0)
            : 0.0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            // Calculate proximity to the current page frame
            final difference = (pageValue - index).abs();
            final closeness = (1.0 - difference).clamp(0.0, 1.0);

            // Scale active width
            final width = 20.0 + (30.0 * closeness);

            // Interpolate activation colors smoothly
            final activeColor = context.kitColors.brandPrimary;
            final inactiveColor = context.kitColors.brandPrimary.withValues(
              alpha: 0.2,
            );
            final color =
                Color.lerp(inactiveColor, activeColor, closeness) ??
                inactiveColor;

            return InkWell(
              onTap: () {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: width,
                height: dotHeight,
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: context.borderRadius.pill,
                  color: color,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
