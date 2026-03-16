import 'dart:ui';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    this.color,
    this.borderColor,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(context.spacing.s4);

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            width: width,
            height: height,
            padding: padding ?? EdgeInsets.all(context.spacing.s4),
            decoration: BoxDecoration(
              color:
                  color ??
                  Colors.white.withValues(alpha: 0.1), // glass background
              borderRadius: effectiveBorderRadius,
              border: Border.all(
                color:
                    borderColor ??
                    Colors.white.withValues(alpha: 0.3), // glass border
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
