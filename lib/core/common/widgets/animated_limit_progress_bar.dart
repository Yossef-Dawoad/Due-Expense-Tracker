import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A linear progress bar with an animated fill and a circular thumb pointer.
class AnimatedLimitProgressBar extends StatelessWidget {
  const AnimatedLimitProgressBar({
    super.key,
    required this.fraction,
    required this.barColor,
    this.height = 10.0,
    this.animationDuration = const Duration(milliseconds: 700),
    this.thumbSize = 16.0,
  });

  /// The progress fraction, from 0.0 to 1.0.
  final double fraction;

  /// The active color of the progress bar and thumb border.
  final Color barColor;

  /// The thickness of the progress bar track.
  final double height;

  /// Duration for the width animation.
  final Duration animationDuration;

  /// Diameter of the thumb pointer.
  final double thumbSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        // Clamp to avoid layout overflow issues with the border handle
        final progress = fraction.clamp(0.04, 1.0);
        final barWidth = containerWidth * progress;
        final thumbOffset = thumbSize / 2;
        final verticalCenterOffset = (height - thumbSize) / 2;

        return SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              // Background Track
              Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: colors.bgSurfaceSecondary,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: colors.borderDefault),
                ),
              ),
              // Animated Fill and Thumb
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: barWidth),
                duration: animationDuration,
                curve: Curves.easeOutCubic,
                builder: (context, currentWidth, _) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Active Track
                      Container(
                        width: currentWidth,
                        height: height,
                        decoration: BoxDecoration(
                          color: barColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      // Circular Thumb Handle
                      Positioned(
                        left: currentWidth - thumbOffset,
                        top: verticalCenterOffset,
                        child: Container(
                          width: thumbSize,
                          height: thumbSize,
                          decoration: BoxDecoration(
                            color: colors.bgSurface,
                            shape: BoxShape.circle,
                            border: Border.all(color: barColor, width: 3.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
