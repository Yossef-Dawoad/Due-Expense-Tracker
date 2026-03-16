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

    return Container(
      padding: const EdgeInsets.all(16), // HTML: p-4
      decoration: BoxDecoration(
        color: colors.bgSurface, // bg-surface
        borderRadius: BorderRadius.circular(16), // rounded-2xl
        border: Border.all(
          color: colors.borderLight, // border-border-light
        ),
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
                // HTML: text-[13px] font-extrabold
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800, // extrabold
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2), // HTML: mt-0.5
                // HTML: text-[12px] leading-relaxed text-text-muted font-medium
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500, // medium
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
    final colors = context.kitColors;
    // HTML: size-8 rounded-lg bg-white border border-border-light shadow-soft flex items-center justify-center
    return Container(
      width: 32, // HTML: size-8 = 32px
      height: 32,
      decoration: BoxDecoration(
        color: colors
            .bgSurface, // Assuming background is white based on Tailwind bg-white (or surface depending on theme)
        borderRadius: BorderRadius.circular(16), // rounded-lg
        border: Border.all(color: colors.borderLight), // border-border-light
        boxShadow: [
          BoxShadow(
            // shadow-soft approx 0 2px 8px rgba(0,0,0,0.06)
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(Icons.lightbulb_outline, color: iconColor, size: 20),
      ),
    );
  }
}
