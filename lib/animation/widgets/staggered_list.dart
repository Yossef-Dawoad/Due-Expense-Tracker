// StaggeredListAnimation widget for cascading list animations.

import 'package:flutter/material.dart';

import 'slide_in.dart';

/// A widget that animates a list of children with a staggered timing effect.
///
/// Each child appears with a slight delay after the previous one, creating
/// a cascading animation effect that draws attention to the list items in sequence.
///
/// **When to use**:
/// *   Displaying lists or grids of items.
/// *   Sequencing form fields.
/// *   Revealing menu items.
///
/// **Usage**:
/// ```dart
/// StaggeredListAnimation(
///   children: [Item1(), Item2(), Item3()],
///   staggerDuration: Duration(milliseconds: 80),
/// )
/// ```
class StaggeredListAnimation extends StatefulWidget {
  /// The list of widgets to animate.
  final List<Widget> children;

  /// Duration for each individual item's animation.
  final Duration itemDuration;

  /// Initial delay before starting the first animation.
  final Duration delay;

  /// Delay between each item's animation start.
  final Duration staggerDuration;

  /// Animation curve to control the timing function.
  final Curve curve;

  /// Direction of the stagger effect (and layout).
  /// Uses [Flex] internally.
  final Axis direction;

  /// Cross axis alignment for the internal [Flex].
  final CrossAxisAlignment crossAxisAlignment;

  /// Creates a staggered list animation widget.
  const StaggeredListAnimation({
    super.key,
    required this.children,
    this.itemDuration = const Duration(milliseconds: 350),
    this.delay = const Duration(milliseconds: 100),
    this.staggerDuration = const Duration(milliseconds: 80),
    this.curve = Curves.easeOutBack,
    this.direction = Axis.vertical,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  State<StaggeredListAnimation> createState() => _StaggeredListAnimationState();
}

class _StaggeredListAnimationState extends State<StaggeredListAnimation> {
  @override
  Widget build(BuildContext context) {
    // Respect accessibility reduced motion preference
    if (MediaQuery.of(context).disableAnimations) {
      return Flex(
        direction: widget.direction,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: widget.children,
      );
    }

    final staggeredChildren = List.generate(widget.children.length, (index) {
      final itemDelay = widget.delay + (widget.staggerDuration * index);
      // Use RepaintBoundary to prevent list items from triggering unnecessary repaints
      return RepaintBoundary(
        child: ClassicSlideWithFadeInAnimation(
          delay: itemDelay,
          duration: widget.itemDuration,
          curve: widget.curve,
          // Support horizontal staggered lists by checking axis
          beginOffset: widget.direction == Axis.vertical
              ? const Offset(0, 0.1)
              : const Offset(0.1, 0),
          child: widget.children[index],
        ),
      );
    });

    // Use Flex to support both vertical and horizontal layouts
    return Flex(
      direction: widget.direction,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: staggeredChildren,
    );
  }
}
