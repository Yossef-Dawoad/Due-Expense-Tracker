import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppSurfaceCard extends StatelessWidget {
  const AppSurfaceCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.boxShadow,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.kitColors.bgSurface,
        borderRadius: borderRadius ?? context.borderRadius.xxl,
        border: Border.all(
          color: borderColor ?? context.kitColors.borderDefault,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
