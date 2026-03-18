import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class UserGreetingHeaderBar extends StatelessWidget {
  const UserGreetingHeaderBar({
    super.key,
    required this.avatarUrl,
    required this.eyebrow,
    required this.userName,
    this.onNotificationsPressed,
    this.hasUnreadNotifications = false,
  });

  final String avatarUrl;
  final String eyebrow;
  final String userName;
  final VoidCallback? onNotificationsPressed;
  final bool hasUnreadNotifications;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withValues(alpha: 0.10)),
              image: DecorationImage(
                image: NetworkImage(avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: colors.textTertiary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          _NotificationIconButton(
            onPressed: onNotificationsPressed,
            hasUnreadNotifications: hasUnreadNotifications,
          ),
        ],
      ),
    );
  }
}

class _NotificationIconButton extends StatelessWidget {
  const _NotificationIconButton({
    required this.onPressed,
    required this.hasUnreadNotifications,
  });

  final VoidCallback? onPressed;
  final bool hasUnreadNotifications;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20),
            child: Ink(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.bgSurface,
                shape: BoxShape.circle,
                border: Border.all(color: colors.borderLight),
              ),
              child: Icon(
                Icons.notifications_none_rounded,
                color: colors.textPrimary,
                size: 24,
              ),
            ),
          ),
        ),
        if (hasUnreadNotifications)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFDC2626),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
