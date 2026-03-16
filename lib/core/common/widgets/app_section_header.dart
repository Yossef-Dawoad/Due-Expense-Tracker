import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.spacing,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    titleStyle ??
                    textStyles.headingLG.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              if (subtitle != null) ...[
                SizedBox(height: spacing ?? context.spacing.s1),
                Text(
                  subtitle!,
                  style:
                      subtitleStyle ??
                      textStyles.bodySM.copyWith(
                        color: colors.textTertiary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) ...[
          SizedBox(width: context.spacing.s4),
          trailing!,
        ],
      ],
    );
  }
}
