import 'package:expancetracker/core/constants/textstyles.dart';
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
        Text(title, style: f18BlackBold.copyWith(color: Colors.black54)),
        if (actionIcon != null)
          IconButton(
            icon: Icon(actionIcon, color: Colors.blue),
            onPressed: onActionTap,
          )
      ],
    );
  }
}
