import 'package:expancetracker/core/services/sync_orchestration_service.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:flutter/material.dart';

/// Top header row with user avatar, greeting text, and notification bell icon.
/// HTML ref: flex items-center px-6 pt-6 pb-2 justify-between
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.isConnected,
    required this.syncState,
    required this.onSyncPressed,
  });

  final bool isConnected;
  final SyncState syncState;
  final VoidCallback onSyncPressed;

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

          _SyncStatusButton(
            colors: colors,
            isConnected: isConnected,
            syncState: syncState,
            onPressed: onSyncPressed,
          ),
        ],
      ),
    );
  }
}

class _SyncStatusButton extends StatelessWidget {
  const _SyncStatusButton({
    required this.colors,
    required this.isConnected,
    required this.syncState,
    required this.onPressed,
  });

  final KitColorsExtension colors;
  final bool isConnected;
  final SyncState syncState;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final visual = _statusVisual();

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
                color: colors.bgSurfaceSecondary,
                shape: BoxShape.circle,
                border: Border.all(color: visual.ringColor, width: 1.2),
              ),
              child: Icon(visual.icon, color: colors.textPrimary, size: 22),
            ),
          ),
        ),
        Positioned(
          right: -1,
          top: -1,
          child: AnimatedContainer(
            duration: context.durations.duration200,
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              color: visual.badgeColor,
              shape: BoxShape.circle,
              border: Border.all(color: colors.bgBase, width: 2),
              boxShadow: [
                BoxShadow(
                  color: visual.badgeColor.withValues(alpha: 0.35),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _SyncBadgeVisual _statusVisual() {
    if (!isConnected) {
      return _SyncBadgeVisual(
        icon: Icons.cloud_off_rounded,
        badgeColor: colors.semanticNeutral,
        ringColor: colors.borderDefault,
      );
    }

    if (syncState.status == SyncStatus.syncing) {
      return _SyncBadgeVisual(
        icon: Icons.sync_rounded,
        badgeColor: colors.brandPrimary,
        ringColor: colors.brandPrimary.withValues(alpha: 0.35),
      );
    }

    if (syncState.status == SyncStatus.failed || syncState.pendingCount > 0) {
      return _SyncBadgeVisual(
        icon: Icons.cloud_upload_rounded,
        badgeColor: const Color(0xFFF59E0B),
        ringColor: const Color(0xFFF59E0B).withValues(alpha: 0.3),
      );
    }

    return _SyncBadgeVisual(
      icon: Icons.cloud_done_rounded,
      badgeColor: colors.semanticPositive,
      ringColor: colors.semanticPositive.withValues(alpha: 0.3),
    );
  }
}

class _SyncBadgeVisual {
  const _SyncBadgeVisual({
    required this.icon,
    required this.badgeColor,
    required this.ringColor,
  });

  final IconData icon;
  final Color badgeColor;
  final Color ringColor;
}
