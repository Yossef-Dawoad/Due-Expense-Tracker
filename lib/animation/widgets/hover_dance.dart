import 'package:flutter/material.dart';

/// A continuous hovering and subtle dancing animation.
///
/// This widget creates a gentle floating effect by animating a translation on the Y-axis
/// and a slight rotation. It is designed to be continuous (looping) and is great
/// for drawing attention to items in a fun, natural way (e.g., dancing books).
class HoverDanceAnimation extends StatefulWidget {
  final Widget child;

  /// Duration for one complete cycle of the animation.
  final Duration duration;

  /// Maximum vertical displacement in logical pixels.
  final double verticalOffset;

  /// Maximum rotation angle in radians.
  final double maxRotation;

  /// An initial delay/offset to desync multiple instances of this animation.
  /// A value between 0.0 and 1.0 representing the starting progress of the animation cycle.
  final double phaseOffset;

  const HoverDanceAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 2000),
    this.verticalOffset = 4.0,
    this.maxRotation = 0.02, // approx 1.15 degrees
    this.phaseOffset = 0.0,
  }) : assert(phaseOffset >= 0.0 && phaseOffset <= 1.0);

  @override
  State<HoverDanceAnimation> createState() => _HoverDanceAnimationState();
}

class _HoverDanceAnimationState extends State<HoverDanceAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      // Start at the given phase
      value: widget.phaseOffset,
    )..repeat(reverse: true);
  }

  @override
  void didUpdateWidget(HoverDanceAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Curve the value for a smoother, natural spring-like feel at the extremes
        final curvedValue = Curves.easeInOutSine.transform(_controller.value);

        // Calculate the current offset and rotation
        // value goes from 0 to 1 to 0.
        // We map it to go from -1 to 1 for full bidirectional movement from the center.
        final directionalValue = (curvedValue * 2) - 1;

        final dy = directionalValue * widget.verticalOffset;
        final rotation = directionalValue * widget.maxRotation;

        return Transform.translate(
          offset: Offset(0, dy),
          child: Transform.rotate(angle: rotation, child: child),
        );
      },
      child: widget.child,
    );
  }
}
