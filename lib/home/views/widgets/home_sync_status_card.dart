import 'package:expancetracker/core/services/sync_orchestration_service.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:flutter/material.dart';

class HomeSyncStatusCard extends StatelessWidget {
  const HomeSyncStatusCard({
    super.key,
    required this.isConnected,
    required this.syncState,
    required this.onRefresh,
  });

  final bool isConnected;
  final SyncState syncState;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;
    final status = _statusModel(colors);

    return AnimatedContainer(
      duration: context.durations.duration200,
      curve: Curves.easeOutCubic,
      padding: EdgeInsets.all(spacing.cardPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [status.backgroundStart, status.backgroundEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: context.borderRadius.card,
        border: Border.all(color: status.borderColor, width: 1),
        boxShadow: context.shadows.elevation2,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: status.iconBackground,
              borderRadius: context.borderRadius.iconContainer,
            ),
            child: Icon(status.icon, color: status.accentColor, size: 22),
          ),
          SizedBox(width: spacing.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _StatusPulse(color: status.accentColor),
                    SizedBox(width: spacing.s2),
                    Expanded(
                      child: Text(
                        status.title,
                        style: textStyles.headingMD.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing.s1),
                Text(
                  status.message,
                  style: textStyles.bodySM.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: spacing.s3),
          IconButton.filledTonal(
            onPressed: isConnected ? onRefresh : null,
            style: IconButton.styleFrom(
              backgroundColor: status.iconBackground,
              disabledBackgroundColor: colors.bgSurface.withValues(alpha: 0.55),
              foregroundColor: status.accentColor,
            ),
            icon: Icon(
              syncState.status == SyncStatus.syncing
                  ? Icons.sync_rounded
                  : Icons.cloud_upload_rounded,
            ),
          ),
        ],
      ),
    );
  }

  _HomeSyncStatusVisuals _statusModel(KitColorsExtension colors) {
    if (!isConnected) {
      return _HomeSyncStatusVisuals(
        title: 'Offline mode',
        message:
            'Your changes stay safe on this device and sync when you reconnect.',
        icon: Icons.cloud_off_rounded,
        accentColor: colors.semanticNeutral,
        backgroundStart: colors.bgSurface,
        backgroundEnd: colors.bgSurfaceSecondary,
        borderColor: colors.borderDefault,
        iconBackground: colors.bgBase,
      );
    }

    if (syncState.status == SyncStatus.syncing) {
      return _HomeSyncStatusVisuals(
        title: 'Syncing securely',
        message: syncState.pendingCount > 0
            ? '${syncState.pendingCount} change${syncState.pendingCount == 1 ? '' : 's'} are on the way to the cloud.'
            : 'Checking your latest balances and transactions now.',
        icon: Icons.sync_rounded,
        accentColor: colors.brandPrimaryDark,
        backgroundStart: colors.brandPrimaryLight,
        backgroundEnd: colors.bgSurface,
        borderColor: colors.brandPrimary.withValues(alpha: 0.25),
        iconBackground: colors.bgSurface,
      );
    }

    if (syncState.status == SyncStatus.failed || syncState.pendingCount > 0) {
      final pendingCount = syncState.pendingCount;
      return _HomeSyncStatusVisuals(
        title: pendingCount > 0
            ? '$pendingCount change${pendingCount == 1 ? '' : 's'} waiting to sync'
            : 'Sync needs attention',
        message: isConnected
            ? 'We will keep retrying in the background until everything reaches the cloud.'
            : 'Reconnect to finish sending your latest changes.',
        icon: Icons.cloud_upload_rounded,
        accentColor: const Color(0xFFB45309),
        backgroundStart: const Color(0xFFFFF7ED),
        backgroundEnd: colors.bgSurface,
        borderColor: const Color(0xFFF59E0B).withValues(alpha: 0.28),
        iconBackground: const Color(0xFFFFEDD5),
      );
    }

    return _HomeSyncStatusVisuals(
      title: 'Connected and in sync',
      message: 'All balances, transactions, and categories are fully synced.',
      icon: Icons.cloud_done_rounded,
      accentColor: colors.semanticPositive,
      backgroundStart: colors.bgSurface,
      backgroundEnd: colors.brandPrimaryLight.withValues(alpha: 0.55),
      borderColor: colors.brandPrimary.withValues(alpha: 0.22),
      iconBackground: colors.bgSurface,
    );
  }
}

class _StatusPulse extends StatelessWidget {
  const _StatusPulse({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: 10),
        ],
      ),
    );
  }
}

class _HomeSyncStatusVisuals {
  const _HomeSyncStatusVisuals({
    required this.title,
    required this.message,
    required this.icon,
    required this.accentColor,
    required this.backgroundStart,
    required this.backgroundEnd,
    required this.borderColor,
    required this.iconBackground,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color accentColor;
  final Color backgroundStart;
  final Color backgroundEnd;
  final Color borderColor;
  final Color iconBackground;
}
