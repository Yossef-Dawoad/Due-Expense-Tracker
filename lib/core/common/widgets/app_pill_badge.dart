import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppPillBadge extends StatelessWidget {
  const AppPillBadge({
    super.key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.padding,
    this.textStyle,
  });

  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final effectiveTextColor = textColor ?? colors.brandPrimary;

    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: context.spacing.s3,
            vertical: context.spacing.s2,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? effectiveTextColor.withValues(alpha: 0.10),
        borderRadius: context.borderRadius.pill,
        border: borderColor == null ? null : Border.all(color: borderColor!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: effectiveTextColor),
            SizedBox(width: context.spacing.s1),
          ],
          Text(
            label,
            style:
                textStyle ??
                context.textStyles.caption.copyWith(
                  color: effectiveTextColor,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
