import 'package:flutter/material.dart';

/// A standardized icon container with a tinted background and border,
/// enforcing exact corner radii and padding.
class ColoredFeatureIcon extends StatelessWidget {
  const ColoredFeatureIcon({
    super.key,
    required this.icon,
    required this.baseColor,
    this.containerSize = 36.0,
    this.iconSize = 20.0,
    this.borderRadius = 12.0,
  });

  /// The icon to display.
  final IconData icon;

  /// The base color used to derive the icon color, background tint, and border tint.
  final Color baseColor;

  /// The width and height of the outer container.
  final double containerSize;

  /// The size of the inner icon.
  final double iconSize;

  /// The border radius of the container.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.12),
        border: Border.all(color: baseColor.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(icon, color: baseColor, size: iconSize),
    );
  }
}
