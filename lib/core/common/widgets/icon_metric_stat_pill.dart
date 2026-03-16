import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// An inline pill-shaped card displaying an icon, a label, and an animated
/// odometer value (used for metrics like "Remaining" and "Spent").
class IconMetricStatPill extends StatelessWidget {
  const IconMetricStatPill({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.prefix = '\$',
    this.decimalPlaces = 0,
    this.startDelay = Duration.zero,
    this.digitStaggerDelay = const Duration(milliseconds: 35),
  });

  /// The small label displayed above the value.
  final String label;

  /// The numeric value to animate.
  final double value;

  /// The icon displayed on the left side of the pill.
  final IconData icon;

  /// The tint color of the icon.
  final Color iconColor;

  /// Prefix before the numeric value, defaults to '$'.
  final String prefix;

  /// Decimal places for the odometer.
  final int decimalPlaces;

  /// The start delay for the odometer animation.
  final Duration startDelay;

  /// Stagger duration for individual digits.
  final Duration digitStaggerDelay;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    // bg-slate-50 px-4 py-2.5 rounded-full border border-border-defined
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: colors.bgSurfaceSecondary, // slate-50 ~ surface secondary
        borderRadius: BorderRadius.circular(999), // rounded-full
        border: Border.all(color: colors.borderDefault),
      ),
      child: Row(
        children: [
          // Icon box: bg-white p-1 rounded-md shadow-sm border border-slate-100
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: colors.bgSurface,
              borderRadius: BorderRadius.circular(6), // rounded-md
              border: Border.all(color: colors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Icon(icon, color: iconColor, size: 12), // w-3 h-3
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: textStyles.labelSM.copyWith(
                    fontSize: 9, // text-[9px]
                    fontWeight: FontWeight.w700,
                    color: colors.semanticNeutral, // slate-500
                    letterSpacing: 0.5, // tracking-wider
                  ),
                ),
                OdometerText(
                  value: value,
                  prefix: prefix,
                  decimalPlaces: decimalPlaces,
                  startDelay: startDelay,
                  digitStagger: digitStaggerDelay,
                  style: textStyles.bodyMD.copyWith(
                    fontSize: 16, // text-base
                    fontWeight: FontWeight.w900, // font-black
                    color: colors.textPrimary, // slate-900
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
