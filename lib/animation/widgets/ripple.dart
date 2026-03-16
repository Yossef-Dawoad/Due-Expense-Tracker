// RippleAnimation widget for continuous outward expanding ripples.

import 'package:flutter/material.dart';

import '../mixins.dart';

/// A widget that creates a water ripple animation effect (expanding borders that fade out).
///
/// This does not scale down the child. Instead, it draws animated strokes around the child.
///
/// **When to use**:
/// *   To draw attention to a clickable element in a subtle way.
/// *   Instead of a standard pulse when a more organic feel is desired.
class RippleAnimation extends StatefulWidget {
  /// The widget to wrap.
  final Widget child;

  /// Duration of one ripple cycle.
  final Duration duration;

  /// The color of the ripples.
  final Color color;

  /// The width of the ripple strokes.
  final double borderWidth;

  /// The maximum outward expansion in logical pixels.
  final double maxSpread;

  const RippleAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 2000),
    required this.color,
    this.borderWidth = 1.5,
    this.maxSpread = 12.0,
  });

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = createController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).disableAnimations ||
        MediaQuery.of(context).accessibleNavigation) {
      if (_controller.isAnimating) _controller.stop();
      return widget.child;
    }

    if (!_controller.isAnimating) {
      _controller.repeat();
    }

    // We use Stack with overflow visible instead of drawing ON the child to ensure it renders correctly on top or under.
    // However, CustomPaint handles this natively. 
    return RepaintBoundary(
      child: CustomPaint(
        painter: _RipplePainter(
          animation: _controller,
          color: widget.color,
          borderWidth: widget.borderWidth,
          maxSpread: widget.maxSpread,
        ),
        child: widget.child,
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final double borderWidth;
  final double maxSpread;

  _RipplePainter({
    required this.animation,
    required this.color,
    required this.borderWidth,
    required this.maxSpread,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final progress = animation.value;
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Draw two overlapping ripples
    for (int i = 0; i < 2; i++) {
      // Offset the second ripple by half the duration (0.5 progress)
      final offsetProgress = (progress + (i * 0.5)) % 1.0;

      // Opacity fades out from Max to 0 as it progresses outward
      final opacity = (1.0 - offsetProgress).clamp(0.0, 1.0);
      final spread = offsetProgress * maxSpread;

      paint.color = color.withValues(alpha: opacity * 0.6); // 60% max opacity
      
      // Expand the rect around the center
      final Rect expandedRect = rect.inflate(spread);
      
      // Compute border radius dynamically using the height to maintain pill shape
      final radius = Radius.circular((size.height + spread * 2) / 2);
      final RRect rrect = RRect.fromRectAndRadius(expandedRect, radius);

      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _RipplePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.maxSpread != maxSpread;
  }
}
