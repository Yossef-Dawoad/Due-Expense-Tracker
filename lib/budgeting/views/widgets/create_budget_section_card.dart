import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class CreateBudgetSectionCard extends StatelessWidget {
  const CreateBudgetSectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textStyles = context.textStyles;
    final colors = context.kitColors;

    return AppSurfaceCard(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.cardPadding),
      borderRadius: context.borderRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSectionHeader(
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            titleStyle: textStyles.headingMD.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
            subtitleStyle: textStyles.bodySM.copyWith(
              color: colors.textTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: spacing.s4),
          child,
        ],
      ),
    );
  }
}
