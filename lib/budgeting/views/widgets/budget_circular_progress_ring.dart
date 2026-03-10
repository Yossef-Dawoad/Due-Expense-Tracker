import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:expancetracker/core/ui/app_theme.dart';

/// Atom: A circular arc progress ring drawn via [CustomPainter].
/// Matches the SVG ring in the HTML mockup: track + colored arc + center text.
class BudgetCircularProgressRing extends StatelessWidget {
  const BudgetCircularProgressRing({
    super.key,
    required this.spentFraction,
    required this.percentageLabel,
    this.size = 192.0,
  });

  final double spentFraction;
  final String percentageLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _CircularRingPainter(
              spentFraction: spentFraction,
              trackColor: colors.brandPrimary.withValues(alpha: 0.10),
              progressColor: colors.brandPrimary,
              strokeWidth: 12.0,
            ),
          ),
          _RingCenterLabel(percentageLabel: percentageLabel),
        ],
      ),
    );
  }
}

class _RingCenterLabel extends StatelessWidget {
  const _RingCenterLabel({required this.percentageLabel});

  final String percentageLabel;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.kitColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          percentageLabel,
          style: textStyles.displayMD.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Overall Spent',
          style: textStyles.caption.copyWith(
            color: colors.brandPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _CircularRingPainter extends CustomPainter {
  const _CircularRingPainter({
    required this.spentFraction,
    required this.trackColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  final double spentFraction;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (strokeWidth / 2);

    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * spentFraction.clamp(0.0, 1.0);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // start at top (−90°)
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularRingPainter oldDelegate) =>
      oldDelegate.spentFraction != spentFraction ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.progressColor != progressColor ||
      oldDelegate.strokeWidth != strokeWidth;
}
