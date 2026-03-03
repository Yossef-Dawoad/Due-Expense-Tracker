// PulseAnimation widget for attention-grabbing pulsing effects.

import 'package:flutter/material.dart';

import '../mixins.dart';

/// A widget that creates a pulsing animation effect.
///
/// This animation continuously cycles through growing and shrinking phases.
///
/// **When to use**:
/// *   To draw attention to a primary call-to-action (CTA).
/// *   For recording indicators or "live" status badges.
/// *   To indicate an element is interactive.
///
/// **Usage**:
/// ```dart
/// PulseAnimation(
///   child: FloatingActionButton(onPressed: () {}),
///   minScale: 0.9,
///   maxScale: 1.1,
/// )
/// ```
class PulseAnimation extends StatefulWidget {
  /// The widget to apply the pulsing animation to.
  final Widget child;

  /// Duration for a complete pulse cycle.
  final Duration duration;

  /// Animation curve to control the pulsing motion.
  final Curve curve;

  /// Minimum scale factor (smallest size during pulse).
  final double minScale;

  /// Maximum scale factor (largest size during pulse).
  final double maxScale;

  /// Whether the animation should automatically start.
  final bool autoStart;

  /// Creates a pulse animation widget.
  const PulseAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeInOut,
    this.minScale = 0.97,
    this.maxScale = 1.03,
    this.autoStart = true,
  });

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = createController(vsync: this, duration: widget.duration);

    // Create a more efficient animation sequence with proper weighting
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: widget.maxScale,
        ).chain(CurveTween(curve: widget.curve)),
        weight: 33.3,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.maxScale,
          end: widget.minScale,
        ).chain(CurveTween(curve: widget.curve)),
        weight: 33.3,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.minScale,
          end: 1.0,
        ).chain(CurveTween(curve: widget.curve)),
        weight: 33.3,
      ),
    ]).animate(_controller);

    // Only start animation if autoStart is true
    if (widget.autoStart) {
      _controller.repeat();
    }
  }

  /// Manually start the pulsing animation
  void start() {
    if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  /// Manually stop the pulsing animation
  void stop() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void didUpdateWidget(PulseAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle changes to animation properties
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    // Handle changes to autoStart
    if (!oldWidget.autoStart && widget.autoStart && !_controller.isAnimating) {
      _controller.repeat();
    } else if (oldWidget.autoStart &&
        !widget.autoStart &&
        _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final shouldAnimate = !MediaQuery.of(context).disableAnimations;
    if (!shouldAnimate) {
      if (_controller.isAnimating) _controller.stop();
      return widget.child;
    }

    if (widget.autoStart && !_controller.isAnimating) {
      _controller.repeat();
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
