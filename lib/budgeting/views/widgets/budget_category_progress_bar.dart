import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';

/// Atom: A horizontal linear progress bar showing budget spending.
/// Renders a track + a filled portion, then a remaining/spent label row below.
class BudgetCategoryProgressBar extends StatelessWidget {
  const BudgetCategoryProgressBar({
    super.key,
    required this.spentFraction,
    required this.remainingLabel,
    required this.spentLabel,
    this.barColor,
    this.trackColor,
    this.labelColor,
  });

  final double spentFraction;
  final String remainingLabel;
  final String spentLabel;
  final Color? barColor;
  final Color? trackColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final borderRadius = context.borderRadius;

    return Column(
      children: [
        _ProgressTrack(
          spentFraction: spentFraction,
          barColor: barColor ?? colors.brandPrimary,
          trackColor: trackColor ?? colors.brandPrimary.withValues(alpha: 0.10),
          progressBarRadius: borderRadius.progressBar,
        ),
        const SizedBox(height: 8),
        _SpendingLabels(
          remainingLabel: remainingLabel,
          spentLabel: spentLabel,
          labelColor: labelColor ?? colors.brandPrimary,
        ),
      ],
    );
  }
}

class _ProgressTrack extends StatelessWidget {
  const _ProgressTrack({
    required this.spentFraction,
    required this.barColor,
    required this.trackColor,
    required this.progressBarRadius,
  });

  final double spentFraction;
  final Color barColor;
  final Color trackColor;
  final BorderRadius progressBarRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: progressBarRadius,
      child: Container(
        height: 8,
        color: trackColor,
        child: FractionallySizedBox(
          widthFactor: spentFraction.clamp(0.0, 1.0),
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: progressBarRadius,
            ),
          ),
        ),
      ),
    );
  }
}

class _SpendingLabels extends StatelessWidget {
  const _SpendingLabels({
    required this.remainingLabel,
    required this.spentLabel,
    required this.labelColor,
  });

  final String remainingLabel;
  final String spentLabel;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final style = textStyles.caption.copyWith(
      color: labelColor,
      fontWeight: FontWeight.w500,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(remainingLabel, style: style),
        Text(spentLabel, style: style),
      ],
    );
  }
}
