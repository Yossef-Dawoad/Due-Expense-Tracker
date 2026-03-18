import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppContentSection extends StatelessWidget {
  const AppContentSection({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = EdgeInsets.zero,
    this.headerSpacing,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry padding;
  final double? headerSpacing;

  @override
  Widget build(BuildContext context) {
    final hasHeader = title != null;

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasHeader)
            AppSectionHeader(
              title: title!,
              subtitle: subtitle,
              trailing: trailing,
              titleStyle: titleStyle,
              subtitleStyle: subtitleStyle,
            ),
          if (hasHeader) SizedBox(height: headerSpacing ?? context.spacing.s4),
          child,
        ],
      ),
    );
  }
}
