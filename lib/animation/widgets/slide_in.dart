// SlideInAnimation and ClassicSlideWithFadeInAnimation widgets.

import 'package:flutter/material.dart';

import '../constants.dart';
import '../mixins.dart';
import 'fade_in.dart';

/// A widget that slides its child into view from a specified offset.
///
/// This animation starts at [beginOffset] and animates to [Offset.zero].
///
/// **When to use**:
/// *   To draw attention to new content entering the screen.
/// *   For list items or cards appearing in a sequence.
/// *   To create a sense of directionality (e.g., sliding from bottom).
///
/// **Usage**:
/// ```dart
/// SlideInAnimation(
///   beginOffset: Offset(0, 0.1), // Slide up slightly
///   child: MyCardWidget(),
/// )
/// ```
class SlideInAnimation extends StatefulWidget {
  /// The widget to slide in.
  final Widget child;

  /// Duration of the slide animation.
  final Duration duration;

  /// Delay before starting the animation.
  final Duration delay;

  /// Animation curve to control the timing function.
  final Curve curve;

  /// Starting offset for the slide animation relative to the final position.
  /// (0, 1) means starting 100% of the height below.
  final Offset beginOffset;

  /// Creates a slide-in animation widget.
  const SlideInAnimation({
    super.key,
    required this.child,
    this.duration = AnimationDurations.medium,
    this.delay = Duration.zero,
    this.curve = Curves.easeOutCubic,
    this.beginOffset = const Offset(0, 0.1),
  });

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = createController(vsync: this, duration: widget.duration);
    _animation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

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
    return SlideTransition(position: _animation, child: widget.child);
  }
}

/// A composite animation that combines [SlideInAnimation] and [FadeInAnimation].
///
/// **When to use**:
/// *   For the most "standard" premium entry effect.
/// *   Almost always preferred over raw fade or raw slide for main content.
class ClassicSlideWithFadeInAnimation extends StatefulWidget {
  const ClassicSlideWithFadeInAnimation({
    super.key,
    required this.child,
    this.duration = AnimationDurations.medium,
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.beginOffset = const Offset(0, 0.2),
  });

  /// The widget to animate
  final Widget child;

  /// Duration of the slide animation
  final Duration duration;

  /// Delay before starting the animation
  final Duration delay;

  /// Animation curve to control the timing function
  final Curve curve;

  /// Starting offset for the slide animation
  final Offset beginOffset;

  @override
  State<ClassicSlideWithFadeInAnimation> createState() =>
      _ClassicSlideWithFadeInAnimationState();
}

class _ClassicSlideWithFadeInAnimationState
    extends State<ClassicSlideWithFadeInAnimation> {
  @override
  Widget build(BuildContext context) {
    return SlideInAnimation(
      beginOffset: widget.beginOffset,
      duration: widget.duration,
      delay: widget.delay,
      curve: widget.curve,
      child: FadeInAnimation(
        duration: widget.duration,
        delay: widget.delay,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}
