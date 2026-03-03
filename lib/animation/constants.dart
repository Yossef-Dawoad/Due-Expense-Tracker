// Animation duration and curve constants for maintaining consistency
// throughout the app's animations.

import 'package:flutter/material.dart';

/// Standard durations for animations throughout the app.
///
/// Using these constants helps maintain consistency in animation timing.
///
/// Usage:
/// ```dart
/// duration: AnimationDurations.medium
/// ```
class AnimationDurations {
  /// Rapid duration for high-frequency feedback (100ms).
  /// Use for: Tap feedback, intense micro-interactions.
  static const Duration rapid = Duration(milliseconds: 100);

  /// Short duration for subtle animations (200ms).
  /// Use for: Tooltips, hover states, minor state changes.
  static const Duration short = Duration(milliseconds: 200);

  /// Medium duration for standard animations (350ms).
  /// Use for: Page transitions, modal appearances, sliding elements.
  static const Duration medium = Duration(milliseconds: 350);

  /// Long duration for complex animations (500ms).
  /// Use for: Large layout changes, orchestrated sequences.
  static const Duration long = Duration(milliseconds: 500);

  /// Longer duration for emphasized animations (700ms).
  /// Use for: Hero animations, splash screens.
  static const Duration longer = Duration(milliseconds: 700);
}

/// Standard animation curves for use throughout the app.
///
/// Using these constants helps maintain consistency in animation behavior.
class AnimationCurves {
  /// Standard easing for most animations (Curves.easeInOut).
  /// Use for: Opacity changes, color transitions, generic scaling.
  static const Curve standard = Curves.easeInOut;

  /// Deceleration curve for elements entering the screen (Curves.easeOutCubic).
  /// Use for: Slide-ins, pop-ups, modal entrances.
  static const Curve decelerate = Curves.easeOutCubic;

  /// Acceleration curve for elements leaving the screen (Curves.easeInCubic).
  /// Use for: Slide-outs, dismissals.
  static const Curve accelerate = Curves.easeInCubic;

  /// Bouncy curve for playful animations (Curves.elasticOut).
  /// Use for: Notification bubbles, 'success' checks, playful interactions.
  static const Curve bounce = Curves.elasticOut;
}
