// AnimatedCounter widget for smooth numeric value transitions.

import 'package:flutter/material.dart';

import '../constants.dart';

/// A widget that smoothy animates changes in integer values.
///
/// **When to use**:
/// *   Scoreboards or stats counters.
/// *   Cart item counts.
/// *   Any numeric value that changes dynamically.
///
/// **Usage**:
/// ```dart
/// AnimatedCounter(
///   value: 42,
///   style: TextStyle(fontSize: 24),
/// )
/// ```
class AnimatedCounter extends StatelessWidget {
  /// The integer value to display.
  final int value;

  /// The text style for the number.
  final TextStyle? style;

  /// Duration of the slide/fade transition.
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.style,
    this.duration = AnimationDurations.medium,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.5),
          end: Offset.zero,
        ).animate(animation);

        final outAnimation = Tween<Offset>(
          begin: const Offset(0.0, -0.5),
          end: Offset.zero,
        ).animate(animation);

        if (child.key == ValueKey(value)) {
          return SlideTransition(
            position: inAnimation,
            child: FadeTransition(opacity: animation, child: child),
          );
        }
        return SlideTransition(
          position: outAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: Text('$value', key: ValueKey(value), style: style),
    );
  }
}
