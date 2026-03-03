// AnimatedGradientBackground widget for dynamic gradient transitions.

import 'package:flutter/material.dart';

import '../mixins.dart';

/// A widget that transitions smoothly between multiple sets of gradient colors.
///
/// **When to use**:
/// *   Ambient backgrounds for meditation or relaxation screens.
/// *   Dynamic headers to create a "living" feel.
/// *   Visualizing mood or state changes.
///
/// **Usage**:
/// ```dart
/// AnimatedGradientBackground(
///   colorSets: [
///     [Colors.blue, Colors.purple],
///     [Colors.red, Colors.orange],
///   ],
///   child: MyContent(),
/// )
/// ```
class AnimatedGradientBackground extends StatefulWidget {
  /// The list of color pairs to cycle through.
  final List<List<Color>> colorSets;

  /// Duration for transitioning between color sets.
  final Duration duration;

  /// The child widget to display on top of the gradient.
  final Widget child;

  /// Creates an animated gradient background.
  const AnimatedGradientBackground({
    super.key,
    required this.colorSets,
    this.duration = const Duration(seconds: 5),
    required this.child,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;
  late int _currentSet;
  late int _nextSet;

  @override
  void initState() {
    super.initState();
    _currentSet = 0;
    _nextSet = 1;
    _controller = createController(vsync: this, duration: widget.duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _currentSet = _nextSet;
            _nextSet = (_nextSet + 1) % widget.colorSets.length;
            _controller.reset();
            _controller.forward();
          });
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // Respect accessibility reduced motion preference
    if (MediaQuery.of(context).disableAnimations) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.colorSets[0],
          ),
        ),
        child: widget.child,
      );
    }

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(
                    widget.colorSets[_currentSet][0],
                    widget.colorSets[_nextSet][0],
                    _controller.value,
                  )!,
                  Color.lerp(
                    widget.colorSets[_currentSet][1],
                    widget.colorSets[_nextSet][1],
                    _controller.value,
                  )!,
                ],
              ),
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
