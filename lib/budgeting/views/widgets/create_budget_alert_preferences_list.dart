import 'package:expancetracker/budgeting/models/create_budget_alert_preferences.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class CreateBudgetAlertPreferencesList extends StatelessWidget {
  const CreateBudgetAlertPreferencesList({
    super.key,
    required this.preferences,
    required this.onNotifyAtNinetyPercentChanged,
    required this.onNotifyWhenExceededChanged,
    required this.onNotifyBeforePeriodEndsChanged,
  });

  final CreateBudgetAlertPreferences preferences;
  final ValueChanged<bool> onNotifyAtNinetyPercentChanged;
  final ValueChanged<bool> onNotifyWhenExceededChanged;
  final ValueChanged<bool> onNotifyBeforePeriodEndsChanged;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      children: [
        _CreateBudgetAlertTile(
          icon: Icons.notifications_active_outlined,
          title: 'Alert me at 90%',
          subtitle:
              'Get a gentle nudge before the budget starts feeling tight.',
          value: preferences.notifyAtNinetyPercent,
          accentColor: context.kitColors.brandPrimary,
          onChanged: onNotifyAtNinetyPercentChanged,
        ),
        SizedBox(height: spacing.s3),
        _CreateBudgetAlertTile(
          icon: Icons.warning_amber_rounded,
          title: 'Alert me when I go over',
          subtitle:
              'Surface an urgent heads-up the moment spending crosses the line.',
          value: preferences.notifyWhenExceeded,
          accentColor: context.kitColors.semanticNegative,
          onChanged: onNotifyWhenExceededChanged,
        ),
        SizedBox(height: spacing.s3),
        _CreateBudgetAlertTile(
          icon: Icons.schedule_rounded,
          title: 'Remind me before the period ends',
          subtitle: 'Useful for weekly resets or a last monthly check-in.',
          value: preferences.notifyBeforePeriodEnds,
          accentColor: context.kitColors.brandPrimaryDark,
          onChanged: onNotifyBeforePeriodEndsChanged,
        ),
      ],
    );
  }
}

class _CreateBudgetAlertTile extends StatelessWidget {
  const _CreateBudgetAlertTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.accentColor,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final Color accentColor;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      backgroundColor: colors.bgBase,
      borderColor: value
          ? accentColor.withValues(alpha: 0.18)
          : colors.borderLight,
      borderRadius: context.borderRadius.xl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredFeatureIcon(
            icon: icon,
            baseColor: value ? accentColor : colors.semanticNeutral,
            containerSize: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyles.bodyMD.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: textStyles.bodySM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Switch.adaptive(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
