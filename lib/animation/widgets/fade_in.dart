// FadeInAnimation widget for smooth fade-in effects.

import 'package:flutter/material.dart';

import '../constants.dart';
import '../mixins.dart';

/// A widget that fades its child into view.
///
/// This animation starts fully transparent and animates to fully opaque.
///
/// **When to use**:
/// *   To smooth out the appearance of new content.
/// *   For images or text that load asynchronously.
/// *   To reduce visual "pop-in".
///
/// **Usage**:
/// ```dart
/// FadeInAnimation(
///   delay: Duration(milliseconds: 100),
///   child: Text("Hello World"),
/// )
/// ```
class FadeInAnimation extends StatefulWidget {
  /// The widget to fade in.
  final Widget child;

  /// Duration of the fade animation.
  /// Defaults to [AnimationDurations.medium].
  final Duration duration;

  /// Delay before starting the animation.
  /// Useful for sequencing multiple animations.
  final Duration delay;

  /// Animation curve to control the timing function.
  /// Defaults to [AnimationCurves.standard].
  final Curve curve;

  /// Creates a fade-in animation widget.
  const FadeInAnimation({
    super.key,
    required this.child,
    this.duration = AnimationDurations.medium,
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
  });

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = createController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    // Delay the start of the animation if specified
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).disableAnimations) {
      _controller.value = 1.0;
    }
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
