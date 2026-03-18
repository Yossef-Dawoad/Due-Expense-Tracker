import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class InsightCalloutCard extends StatelessWidget {
  const InsightCalloutCard({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.lightbulb_outline,
    this.iconColor,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      borderColor: colors.borderLight,
      borderRadius: context.borderRadius.lg,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredFeatureIcon(
            icon: icon,
            baseColor: iconColor ?? colors.brandPrimary,
            containerSize: 32,
            iconSize: 18,
            borderRadius: 16,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: colors.textTertiary,
                    height: 1.625,
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
