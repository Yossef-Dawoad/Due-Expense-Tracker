// BreathingAnimation widget for guided breathing exercises.

import 'package:flutter/material.dart';

/// A widget that creates a breathing animation effect.
///
/// Cycles through Expand -> Hold -> Contract -> Pause phases.
///
/// **When to use**:
/// *   Guided breathing exercises.
/// *   Meditation visual aids.
/// *   Calming loading indicators.
///
/// **Usage**:
/// ```dart
/// BreathingAnimation(
///   minScale: 0.8,
///   maxScale: 1.2,
///   child: CircleAvatar(radius: 50),
/// )
/// ```
class BreathingAnimation extends StatefulWidget {
  /// The widget to apply the breathing animation to.
  final Widget child;

  /// Duration for the expansion phase (inhale).
  final Duration expandDuration;

  /// Duration to hold at maximum scale (hold breath).
  final Duration holdDuration;

  /// Duration for the contraction phase (exhale).
  final Duration contractDuration;

  /// Minimum scale factor (starting and ending point).
  final double minScale;

  /// Maximum scale factor (fully expanded).
  final double maxScale;

  /// Creates a breathing animation widget.
  const BreathingAnimation({
    super.key,
    required this.child,
    this.expandDuration = const Duration(seconds: 4),
    this.holdDuration = const Duration(seconds: 2),
    this.contractDuration = const Duration(seconds: 4),
    this.minScale = 0.8,
    this.maxScale = 1.2,
  });

  @override
  State<BreathingAnimation> createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Use a single controller for the entire breathing cycle
    final totalDuration =
        widget.expandDuration +
        widget.holdDuration +
        widget.contractDuration +
        const Duration(milliseconds: 500);
    _controller = AnimationController(vsync: this, duration: totalDuration);

    // Create a sequence for the entire breathing cycle
    _animation = TweenSequence<double>([
      // Expand phase
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.minScale,
          end: widget.maxScale,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight:
            widget.expandDuration.inMilliseconds / totalDuration.inMilliseconds,
      ),
      // Hold phase
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.maxScale),
        weight:
            widget.holdDuration.inMilliseconds / totalDuration.inMilliseconds,
      ),
      // Contract phase
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.maxScale,
          end: widget.minScale,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight:
            widget.contractDuration.inMilliseconds /
            totalDuration.inMilliseconds,
      ),
      // Pause phase
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.minScale),
        weight: 500 / totalDuration.inMilliseconds,
      ),
    ]).animate(_controller);

    // Use repeat() for cleaner continuous animation
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Respect accessibility reduced motion preference
    if (MediaQuery.of(context).disableAnimations) {
      return widget.child;
    }

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) =>
            Transform.scale(scale: _animation.value, child: child),
        child: widget.child,
      ),
    );
  }
}
