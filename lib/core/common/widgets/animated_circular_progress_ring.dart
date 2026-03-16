import 'dart:math' as math;
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A customizable, animated circular progress ring with an inner widget.
class AnimatedCircularProgressRing extends StatelessWidget {
  const AnimatedCircularProgressRing({
    super.key,
    required this.progressValue,
    required this.activeColor,
    required this.trackColor,
    required this.centerWidget,
    this.size = 96.0,
    this.strokeWidth = 8.0,
    this.animationDuration = const Duration(milliseconds: 1400),
    this.animationCurve = Curves.easeOutCubic,
    this.thumbSize = 16.0,
  });

  /// The progress value from 0.0 to 1.0.
  final double progressValue;

  /// The color of the filled progress ring.
  final Color activeColor;

  /// The color of the background track ring.
  final Color trackColor;

  /// The widget to display in the center of the ring.
  final Widget centerWidget;

  /// The total width and height of the widget.
  final double size;

  /// The thickness of the progress rings.
  final double strokeWidth;

  /// The duration of the fill animation.
  final Duration animationDuration;

  /// The curve of the fill animation.
  final Curve animationCurve;

  /// Diameter of the circular thumb pointer.
  final double thumbSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    // The diameter of the circles inside the box
    final double circleSize = size - strokeWidth - 4;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle track
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              color: trackColor,
            ),
          ),
          // Animated progress circle
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: progressValue.clamp(0.0, 1.0),
              ),
              duration: animationDuration,
              curve: animationCurve,
              builder: (context, value, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: circleSize,
                      height: circleSize,
                      child: CircularProgressIndicator(
                        value: value,
                        strokeWidth: strokeWidth,
                        color: activeColor,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    // Thumb handle
                    if (value > 0)
                      Positioned.fill(
                        child: Transform.rotate(
                          // The CircularProgressIndicator path mathematically ends precisely at value * 2 * pi.
                          // The rounded cap wraps symmetrically around this endpoint, so centering
                          // the thumb exactly on this angle produces visual perfection.
                          angle: value * 2 * math.pi,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Transform.translate(
                              // Align the center of the thumb exactly with the center of the stroke line.
                              // The CircularProgressIndicator draws its stroke perfectly centered on the
                              // bounding box edge. Align.topCenter puts the top of the thumb exactly
                              // at the top edge of the bounding box. Thus, translating it up by half its height
                              // puts its center exactly on the bounding box edge, i.e., the stroke center.
                              offset: Offset(0, -(thumbSize / 2)),
                              child: Container(
                                width: thumbSize,
                                height: thumbSize,
                                decoration: BoxDecoration(
                                  color: colors.bgSurface,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: activeColor,
                                    width:
                                        3.5, // Matches the AnimatedLimitProgressBar
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.1,
                                      ),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          // Inner content
          centerWidget,
        ],
      ),
    );
  }
}
