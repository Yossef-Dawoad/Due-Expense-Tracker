import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AnimatedGradientButton extends StatefulWidget {
  const AnimatedGradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient,
    this.shadowColor,
    this.borderRadius,
    this.padding,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Gradient? gradient;
  final Color? shadowColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  State<AnimatedGradientButton> createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(context.spacing.s6);

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding:
              widget.padding ??
              EdgeInsets.symmetric(
                vertical: context.spacing.s4,
                horizontal: context.spacing.s6,
              ),
          decoration: BoxDecoration(
            borderRadius: effectiveBorderRadius,
            gradient:
                widget.gradient ??
                LinearGradient(
                  colors: [
                    context.kitColors.brandPrimary,
                    context.kitColors.brandPrimaryDark,
                  ],
                ),
            boxShadow: [
              BoxShadow(
                color:
                    widget.shadowColor ??
                    context.kitColors.brandPrimary.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: -5,
              ),
            ],
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
