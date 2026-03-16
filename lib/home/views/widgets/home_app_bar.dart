import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/home/mock_data/home_mock_data.dart';
import 'package:flutter/material.dart';

/// Top header row with user avatar, greeting text, and notification bell icon.
/// HTML ref: flex items-center px-6 pt-5 pb-2 justify-between
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.only(
        top: 4, // equivalent to pt-5 minus safe area
        bottom: 8, // pb-2
      ),
      child: Row(
        children: [
          // Profile avatar with thin ring — HTML: size-10 ring-1 ring-black/10
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withValues(alpha: 0.10)),
              image: const DecorationImage(
                image: NetworkImage(HomeMockData.userAvatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12), // HTML: gap-3
          // Greeting text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HTML: text-[10px] font-extrabold tracking-[0.05em] uppercase
                Text(
                  HomeMockData.greetingPrefix,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800, // extrabold
                    color: colors.textTertiary,
                    letterSpacing: 0.5, // 0.05em × 10px
                  ),
                ),
                const SizedBox(height: 1),
                // HTML: text-text-main text-[15px] font-extrabold
                Text(
                  HomeMockData.userName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800, // extrabold
                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          // Notification Button
          const _NotificationButton(),
        ],
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    // HTML: relative flex items-center justify-center rounded-full size-10 bg-surface border border-border-light text-text-main
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
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
        // Red dot indicator
        // HTML: absolute top-2.5 right-2.5 size-2 bg-red-600 rounded-full border-2 border-white
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFDC2626), // red-600
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ), // Note: HTML says size-2 but border-2 makes it take up all space unless padded. size-2=8px.
            ),
          ),
        ),
      ],
    );
  }
}
