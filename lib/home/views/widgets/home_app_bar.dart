import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:flutter/material.dart';

/// Top header row with user avatar, greeting text, and notification bell icon.
/// HTML ref: flex items-center px-6 pt-6 pb-2 justify-between
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ), // HTML: pt-6 pb-2 (relative to screen top padding)
      child: Row(
        children: [
          // Profile avatar with thin ring — HTML: size-10 ring-1 ring-black/5
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.textPrimary.withValues(alpha: 0.05),
              ),
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(width: 12), // HTML: gap-3
          // Greeting text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HTML: text-[11px] font-bold tracking-[0.05em] uppercase
              Text(
                'GOOD MORNING,',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: colors.textTertiary,
                  letterSpacing: 0.55, // 0.05em × 11px
                ),
              ),
              // HTML: text-[15px] font-bold
              Text(
                'Youssef Dawoud',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Notification icon with badge
          _NotificationBellButton(colors: colors),
        ],
      ),
    );
  }
}

class _NotificationBellButton extends StatelessWidget {
  const _NotificationBellButton({required this.colors});

  final KitColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    // HTML: size-10 rounded-full bg-surface
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors.bgSurfaceSecondary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: colors.textPrimary,
            size: 24,
          ),
        ),
        // HTML: top-2.5 right-2.5 size-2 bg-red-500 border-2 border-white
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: colors.notificationBadge,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
