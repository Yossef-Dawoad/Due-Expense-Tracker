// Animation controller extensions for common animation patterns.

import 'package:flutter/material.dart';

/// Extension on [AnimationController] to simplify creating common animations.
///
/// **When to use**: When defining [Animation] objects in `initState`.
extension AnimationControllerExtension on AnimationController {
  /// Creates a fade animation from 0.0 to 1.0.
  Animation<double> fadeIn(Curve curve) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: this, curve: curve));
  }

  /// Creates a fade animation from 1.0 to 0.0.
  Animation<double> fadeOut(Curve curve) {
    return Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: this, curve: curve));
  }

  /// Creates a slide animation from the given offset to Offset.zero.
  Animation<Offset> slideIn(Offset beginOffset, Curve curve) {
    return Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: this, curve: curve));
  }

  /// Creates a scale animation between the given values.
  Animation<double> scale(double begin, double end, Curve curve) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: this, curve: curve));
  }
}
