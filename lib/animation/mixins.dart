// Animation controller mixin for automatic lifecycle management.

import 'package:flutter/material.dart';

/// A mixin that provides common animation functionality and automatic disposal.
///
/// This mixin helps reduce boilerplate by managing the lifecycle of [AnimationController]s.
///
/// **When to use**: Whenever you need one or more [AnimationController]s in a [StatefulWidget].
///
/// Usage:
/// ```dart
/// class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
///   late AnimationController _controller;
///
///   @override
///   void initState() {
///     super.initState();
///     _controller = createController(vsync: this, duration: AnimationDurations.medium);
///   }
///   // No need to override dispose() to dispose _controller!
/// }
/// ```
mixin AutoDisposeAnimationControllerMixin<T extends StatefulWidget>
    on State<T> {
  /// Creates an animation controller with the specified duration.
  ///
  /// The controller will automatically be disposed when the state is disposed.
  @protected
  AnimationController createController({
    required TickerProvider vsync,
    required Duration duration,
    double lowerBound = 0.0,
    double upperBound = 1.0,
  }) {
    final controller = AnimationController(
      vsync: vsync,
      duration: duration,
      lowerBound: lowerBound,
      upperBound: upperBound,
    );

    // Ensure the controller is disposed when the state is disposed
    _controllers.add(controller);
    return controller;
  }

  // Track all controllers created by this mixin
  final List<AnimationController> _controllers = [];

  @override
  void dispose() {
    // Dispose all controllers when the state is disposed
    for (final ctrl in _controllers) {
      ctrl.dispose();
    }

    _controllers.clear();
    super.dispose();
  }
}
