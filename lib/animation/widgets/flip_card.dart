// FlipCard widget for 3D card flip animations.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../mixins.dart';

/// A widget that implements a 3D card flip animation.
///
/// **When to use**:
/// *   To reveal details (e.g., flashcards, credit card details).
/// *   For before/after comparisons.
/// *   Settings toggles with visual states.
///
/// **Usage**:
/// ```dart
/// FlipCard(
///   front: Card(child: Text("Question")),
///   back: Card(child: Text("Answer")),
/// )
/// ```
class FlipCard extends StatefulWidget {
  /// The front face of the card (initially visible).
  final Widget front;

  /// The back face of the card (initially hidden).
  final Widget back;

  /// Duration of the flip animation.
  final Duration duration;

  /// Optional callback triggered when the card is flipped.
  final VoidCallback? onFlip;

  /// Whether the card should start showing the front side.
  final bool startWithFrontSide;

  /// Whether the card can be flipped by tapping.
  final bool flipOnTap;

  /// Creates a flip card animation widget.
  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    this.duration = const Duration(milliseconds: 400),
    this.onFlip,
    this.startWithFrontSide = true,
    this.flipOnTap = true,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _showFrontSide;

  @override
  void initState() {
    super.initState();
    _showFrontSide = widget.startWithFrontSide;
    _controller = createController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Initialize to back side if needed
    if (!_showFrontSide) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update controller duration if it changed
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
  }

  /// Toggles the card between front and back sides
  void _toggleCard() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _showFrontSide = !_showFrontSide;
    if (widget.onFlip != null) {
      widget.onFlip!();
    }
  }

  /// Flips to the front side
  void flipToFront() {
    if (!_showFrontSide) {
      _toggleCard();
    }
  }

  /// Flips to the back side
  void flipToBack() {
    if (_showFrontSide) {
      _toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Respect accessibility reduced motion preference
    if (MediaQuery.of(context).disableAnimations) {
      return GestureDetector(
        onTap: widget.flipOnTap ? _toggleCard : null,
        child: _showFrontSide ? widget.front : widget.back,
      );
    }

    return GestureDetector(
      onTap: widget.flipOnTap ? _toggleCard : null,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * math.pi;

          // Only show front/back when they're actually visible to improve performance
          final showFront = _animation.value < 0.5;
          final showBack = _animation.value >= 0.5;

          // Calculate rotation for each side
          final frontRotation = showFront ? angle : 0.0;
          final backRotation = showBack ? angle + math.pi : math.pi;

          return Stack(
            children: [
              if (showFront)
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(frontRotation),
                  alignment: Alignment.center,
                  child: widget.front,
                ),
              if (showBack)
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(backRotation),
                  alignment: Alignment.center,
                  child: widget.back,
                ),
            ],
          );
        },
      ),
    );
  }
}
