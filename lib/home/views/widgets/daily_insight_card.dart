import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A card displaying a daily financial insight with a lightbulb icon.
/// HTML ref: bg-surface border-border-light rounded-2xl p-4 flex items-start gap-3
class DailyInsightCard extends StatelessWidget {
  const DailyInsightCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return Container(
      padding: const EdgeInsets.all(16), // HTML: p-4
      decoration: BoxDecoration(
        color: colors.bgSurfaceSecondary,
        borderRadius: context.borderRadius.xxl,
        border: Border.all(color: colors.borderLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lightbulb icon container
          _InsightIconContainer(iconColor: colors.brandPrimary),
          const SizedBox(width: 12), // HTML: gap-3
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HTML: text-[13px] font-bold
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2), // HTML: mt-0.5
                // HTML: text-[12px] leading-relaxed text-text-muted
                Text(
                  message,
                  style: textStyles.caption.copyWith(
                    color: colors.textTertiary,
                    height: 1.625, // leading-relaxed
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

class _InsightIconContainer extends StatelessWidget {
  const _InsightIconContainer({required this.iconColor});

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    // HTML: size-8 rounded-lg bg-white shadow-soft
    // rounded-lg = 1rem = 16px = token `lg`
    return Container(
      width: 32, // HTML: size-8 = 32px
      height: 32,
      decoration: BoxDecoration(
        color: context.kitColors.bgSurface,
        borderRadius: context.borderRadius.sm,
      ),
      child: Icon(Icons.lightbulb_outline, color: iconColor, size: 20),
    );
  }
}
