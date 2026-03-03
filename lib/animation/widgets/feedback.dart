// Feedback widgets: ScaleFeedback and ShakeAnimation.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants.dart';

/// A wrapper widget that adds a tactile scale effect on tap.
///
/// **When to use**:
/// *   Wrap interactive cards, list items, or custom buttons.
/// *   ANY element that is tappable but doesn't have a built-in ripple/feedback.
/// *   To provide immediate physical feedback to user touch.
///
/// **Usage**:
/// ```dart
/// ScaleFeedback(
///   onTap: () => print("Tapped!"),
///   child: Container(padding: EdgeInsets.all(20), child: Text("Tap Me")),
/// )
/// ```
class ScaleFeedback extends StatefulWidget {
  /// The child widget to wrap.
  final Widget child;

  /// Callback when the widget is tapped (after the animation).
  final VoidCallback? onTap;

  /// Duration of the scale animation.
  /// Defaults to [AnimationDurations.rapid] for snappiness.
  final Duration duration;

  /// The target scale when pressed (e.g., 0.95 = 95% size).
  final double minScale;

  const ScaleFeedback({
    super.key,
    required this.child,
    this.onTap,
    this.duration = AnimationDurations.rapid,
    this.minScale = 0.95,
  });

  @override
  State<ScaleFeedback> createState() => _ScaleFeedbackState();
}

class _ScaleFeedbackState extends State<ScaleFeedback> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? widget.minScale : 1.0,
        duration: widget.duration,
        curve: AnimationCurves.decelerate,
        child: widget.child,
      ),
    );
  }
}

/// A widget that moves its child side-to-side to indicate an error or attention state.
///
/// **When to use**:
/// *   Invalid form field submission (e.g., wrong password).
/// *   Action denied feedback.
/// *   Grabbing the user's attention to a specific element.
///
/// **Usage**:
/// ```dart
/// ShakeAnimation(
///   controller: myAnimationController, // Call .forward() to shake
///   child: Text("Invalid Password", style: TextStyle(color: Colors.red)),
/// )
/// ```
class ShakeAnimation extends StatefulWidget {
  /// The child to shake.
  final Widget child;

  /// The controller that drives the shake animation.
  final AnimationController controller;

  /// The maximum horizontal offset during the shake.
  final double offset;

  const ShakeAnimation({
    super.key,
    required this.child,
    required this.controller,
    this.offset = 10.0,
  });

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Sine wave for shake effect
          final sineValue = math.sin(_animation.value * math.pi * 4);
          return Transform.translate(
            offset: Offset(sineValue * widget.offset, 0),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
