import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.title,
    this.actionIcon,
    this.onActionTap,
  });

  final String title;
  final IconData? actionIcon;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textStyles.headingMD.copyWith(
            color: context.kitColors.textSecondary,
          ),
        ),
        if (actionIcon != null)
          IconButton(
            icon: Icon(actionIcon, color: context.kitColors.textLink),
            onPressed: onActionTap,
          ),
      ],
    );
  }
}
