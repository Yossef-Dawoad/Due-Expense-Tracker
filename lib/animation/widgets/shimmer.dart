// ShimmerLoading widget for skeleton loading effects.

import 'package:flutter/material.dart';

import '../mixins.dart';

/// A sophisticated shimmer effect for loading states.
///
/// **When to use**:
/// *   Skeleton loading screens (when data is fetching).
/// *   Image placeholders.
/// *   Masking latency while maintaining visual momentum.
///
/// **Usage**:
/// ```dart
/// ShimmerLoading(
///   isLoading: true,
///   child: Container(width: 100, height: 100, color: Colors.grey),
/// )
/// ```
class ShimmerLoading extends StatefulWidget {
  /// The widget to wrap (usually a simplified "skeleton" version of content).
  final Widget child;

  /// Whether the shimmer effect is active.
  final bool isLoading;

  /// The base color of the skeleton (usually darker grey).
  final Color baseColor;

  /// The highlight/shimmer color (usually lighter grey).
  final Color highlightColor;

  const ShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = createController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    if (MediaQuery.of(context).disableAnimations) {
      // Return a static simplified view or just the base color placeholder
      return ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) {
          return LinearGradient(
            colors: [widget.baseColor, widget.baseColor], // Static
          ).createShader(bounds);
        },
        child: widget.child,
      );
    }

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  widget.baseColor,
                  widget.highlightColor,
                  widget.baseColor,
                ],
                stops: const [0.1, 0.5, 0.9],
                begin: Alignment(-1.0 - (_controller.value * 3), 0.0),
                end: Alignment(
                  1.0 - (_controller.value * 3),
                  0.0,
                ), // Moving gradient
                transform: _SlidingGradientTransform(_controller.value),
              ).createShader(bounds);
            },
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;
  const _SlidingGradientTransform(this.slidePercent);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
