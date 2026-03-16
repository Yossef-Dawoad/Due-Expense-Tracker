import 'dart:math' as math;

import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BudgetCircularProgressRing extends StatelessWidget {
  const BudgetCircularProgressRing({
    super.key,
    required this.spentFraction,
    required this.percentageLabel,
    this.size = 160,
  });

  final double spentFraction;
  final String percentageLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final progress = spentFraction.clamp(0.0, 1.0);
    const strokeWidth = 12.0;
    final dotSize = math.max(24.0, size * 0.15); // increased dot size

    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, animatedProgress, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.brandPrimary.withValues(alpha: 0.08),
                  ),
                ),
              ),
              SizedBox(
                width: size,
                height: size,
                child: CustomPaint(
                  painter: _BudgetRingPainter(
                    progress: animatedProgress,
                    strokeWidth: strokeWidth,
                    backgroundColor: colors.brandPrimary.withValues(
                      alpha: 0.10,
                    ),
                    progressColor: colors.brandPrimary,
                    dotSize: dotSize,
                    dotBgColor: colors.bgSurface,
                    dotShadowColor: colors.brandPrimary.withValues(alpha: 0.18),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    percentageLabel,
                    style: textStyles.headingLG.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    'Overall spent',
                    style: textStyles.caption.copyWith(
                      color: colors.textTertiary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BudgetRingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final double dotSize;
  final Color dotBgColor;
  final Color dotShadowColor;

  _BudgetRingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
    required this.dotSize,
    required this.dotBgColor,
    required this.dotShadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);

    final startAngle = -math.pi / 2;
    final sweepAngle = math.pi * 2 * progress;

    if (progress > 0) {
      final progressPaint = Paint()
        ..color = progressColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        progressPaint,
      );
    }

    final dotAngle = startAngle + sweepAngle;
    final dotCenter = Offset(
      center.dx + radius * math.cos(dotAngle),
      center.dy + radius * math.sin(dotAngle),
    );

    final shadowPaint = Paint()
      ..color = dotShadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(
      Offset(dotCenter.dx, dotCenter.dy + 1),
      dotSize / 2,
      shadowPaint,
    );

    final dotFillPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(dotCenter, dotSize / 2, dotFillPaint);

    final dotBorderPaint = Paint()
      ..color = dotBgColor
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(dotCenter, (dotSize - 2.5) / 2, dotBorderPaint);
  }

  @override
  bool shouldRepaint(covariant _BudgetRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.dotSize != dotSize ||
        oldDelegate.dotBgColor != dotBgColor ||
        oldDelegate.dotShadowColor != dotShadowColor;
  }
}
