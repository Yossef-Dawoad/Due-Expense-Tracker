// Progress indicator widgets: AnimatedProgressBar and AnimatedCircularProgress.

import 'package:flutter/material.dart';

/// A progress bar that animates changes to its progress value.
///
/// **When to use**:
/// *   Loading screens.
/// *   Task completion status.
/// *   Health bars or stat meters.
///
/// **Usage**:
/// ```dart
/// AnimatedProgressBar(
///   progress: 0.75, // 75% complete
///   progressColor: Colors.blue,
/// )
/// ```
class AnimatedProgressBar extends StatefulWidget {
  /// The current progress value between 0.0 and 1.0.
  final double progress;

  /// Background color of the progress bar track.
  final Color backgroundColor;

  /// Color of the progress indicator.
  final Color progressColor;

  /// Height of the progress bar.
  final double height;

  /// Duration of the progress animation.
  final Duration duration;

  /// Animation curve to control the timing function.
  final Curve curve;

  /// Width constraint for the progress bar (null means parent width).
  final double? width;

  /// Creates an animated progress bar widget.
  const AnimatedProgressBar({
    super.key,
    required this.progress,
    this.backgroundColor = const Color(0xFFE2E8F0),
    this.progressColor = const Color(0xFF4FD1C5),
    this.height = 8.0,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.width,
  }) : assert(
         progress >= 0.0 && progress <= 1.0,
         'Progress must be between 0.0 and 1.0',
       );

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> {
  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to get the available width if no width is specified
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = widget.width ?? constraints.maxWidth;

        return Container(
          width: containerWidth,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: widget.duration,
                curve: widget.curve,
                width: containerWidth * widget.progress.clamp(0.0, 1.0),
                decoration: BoxDecoration(
                  color: widget.progressColor,
                  borderRadius: BorderRadius.circular(widget.height / 2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// A circular progress indicator that animates changes to its value.
///
/// **When to use**:
/// *   Workout timers.
/// *   Meditation session progress.
/// *   Downloading status.
///
/// **Usage**:
/// ```dart
/// AnimatedCircularProgress(
///   progress: 0.5,
///   size: 100,
///   child: Text("50%"),
/// )
/// ```
class AnimatedCircularProgress extends StatefulWidget {
  final double progress;
  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Widget? child;
  final Duration duration;
  final Curve curve;

  const AnimatedCircularProgress({
    super.key,
    required this.progress,
    this.size = 100.0,
    this.strokeWidth = 10.0,
    this.backgroundColor = const Color(0xFFE2E8F0),
    this.progressColor = const Color(0xFF4FD1C5),
    this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedCircularProgress> createState() =>
      _AnimatedCircularProgressState();
}

class _AnimatedCircularProgressState extends State<AnimatedCircularProgress> {
  double _previousProgress = 0.0;

  @override
  void didUpdateWidget(AnimatedCircularProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    _previousProgress = oldWidget.progress;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            SizedBox(
              width: widget.size,
              height: widget.size,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: widget.strokeWidth,
                backgroundColor: widget.backgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.backgroundColor,
                ),
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: _previousProgress,
                end: widget.progress,
              ),
              duration: widget.duration,
              curve: widget.curve,
              builder: (context, value, _) {
                return SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: widget.strokeWidth,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.progressColor,
                    ),
                  ),
                );
              },
            ),
            if (widget.child != null)
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: Center(child: widget.child),
              ),
          ],
        ),
      ),
    );
  }
}
