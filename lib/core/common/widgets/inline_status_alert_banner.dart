import 'package:flutter/material.dart';

/// A horizontal alert banner with a leading vertical visual indicator pill
/// and flexible content (usually text).
class InlineStatusAlertBanner extends StatelessWidget {
  const InlineStatusAlertBanner({
    super.key,
    required this.content,
    this.indicatorColor,
    this.leadingWidget,
    this.backgroundColor,
    this.padding = const EdgeInsets.only(bottom: 16),
  });

  /// The main content of the alert, typically [Text.rich] or [Text].
  final Widget content;

  /// The color of the default left-hand vertical indicator pill.
  /// Ignored if [leadingWidget] is provided.
  final Color? indicatorColor;

  /// A custom leading widget to replace the default vertical line indicator.
  final Widget? leadingWidget;

  /// Background color for the banner. If null, no background is applied.
  final Color? backgroundColor;

  /// The outer padding of the entire banner layout.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: backgroundColor != null
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Custom leading widget or default visual indicator pill
          leadingWidget ??
              Container(
                width: 4,
                height: 16,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: indicatorColor ?? Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          const SizedBox(width: 8),
          // Content
          Flexible(child: content),
        ],
      ),
    );
  }
}
