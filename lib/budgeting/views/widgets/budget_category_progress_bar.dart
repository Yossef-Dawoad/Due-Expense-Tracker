import 'package:expancetracker/animation/animation.dart';
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
    this.height = 10,
  });

  final double spentFraction;
  final String remainingLabel;
  final String spentLabel;
  final Color? barColor;
  final Color? trackColor;
  final Color? labelColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Column(
      children: [
        _ProgressTrack(
          spentFraction: spentFraction,
          barColor: barColor ?? colors.brandPrimary,
          trackColor: trackColor ?? colors.brandPrimary.withValues(alpha: 0.10),
          height: height,
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
    required this.height,
  });

  final double spentFraction;
  final Color barColor;
  final Color trackColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    final progress = spentFraction.clamp(0.0, 1.0);

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedProgressBar(
          progress: progress,
          progressColor: barColor,
          backgroundColor: trackColor,
          height: height,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
        ),
        if (progress > 0)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              final dotProgress = value.clamp(0.03, 0.97);

              return Align(
                alignment: Alignment(dotProgress * 2 - 1, 0),
                child: Container(
                  width: height + 4,
                  height: height + 4,
                  decoration: BoxDecoration(
                    color: barColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                    boxShadow: [
                      BoxShadow(
                        color: barColor.withValues(alpha: 0.18),
                        blurRadius: 6,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
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
        Flexible(child: Text(remainingLabel, style: style)),
        const SizedBox(width: 12),
        Flexible(
          child: Text(spentLabel, style: style, textAlign: TextAlign.end),
        ),
      ],
    );
  }
}
