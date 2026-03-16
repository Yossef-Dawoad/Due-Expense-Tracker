import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A highly reusable status pill taking a label and base color,
/// automatically tinting its background and border.
class SemanticStatusBadge extends StatelessWidget {
  const SemanticStatusBadge({
    super.key,
    required this.label,
    required this.baseColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    this.margin = const EdgeInsets.only(bottom: 6),
  });

  /// The text label to display (e.g. "HEALTHY", "ON PACE").
  final String label;

  /// The core semantic color.
  final Color baseColor;

  /// Padding inside the badge.
  final EdgeInsetsGeometry padding;

  /// Margin outside the badge.
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;

    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.12),
        border: Border.all(color: baseColor.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label.toUpperCase(),
        style: textStyles.labelSM.copyWith(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          color: baseColor,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
