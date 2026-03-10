import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'package:expancetracker/core/utils/internal_notification/toast/toast_event.dart';

/// Sync status for the orchestration service.
enum SyncStatus { idle, syncing, succeeded, failed }

/// Immutable state snapshot for current sync progress.
class SyncState {
  final SyncStatus status;
  final int pendingCount;
  final int failedAttempts;
  final String? lastError;

  const SyncState({
    this.status = SyncStatus.idle,
    this.pendingCount = 0,
    this.failedAttempts = 0,
    this.lastError,
  });

  SyncState copyWith({
    SyncStatus? status,
    int? pendingCount,
    int? failedAttempts,
    String? lastError,
  }) {
    return SyncState(
      status: status ?? this.status,
      pendingCount: pendingCount ?? this.pendingCount,
      failedAttempts: failedAttempts ?? this.failedAttempts,
      lastError: lastError ?? this.lastError,
    );
  }
}

/// Central sync coordinator with connectivity awareness and retry logic.
///
/// Orchestrates push/pull sync across all [OfflineFirstRepository] instances.
/// - Listens to [ConnectivityService] — auto-syncs when connectivity is restored.
/// - Retries with exponential backoff (5s → 10s → 20s → 40s) on failure.
/// - Surfaces sync status via [ValueNotifier<SyncState>].
/// - Notifies the user via [NotifyService] toast on persistent failure or reconnect success.
class SyncOrchestrationService {
  SyncOrchestrationService({
    required List<OfflineFirstRepository> repositories,
    required ConnectivityService connectivityService,
    required NotifyService notifyService,
    int maxRetries = 4,
  }) : _repositories = repositories,
       _connectivity = connectivityService,
       _notifyService = notifyService,
       _maxRetries = maxRetries {
    _initialize();
  }

  static final _log = Logger('SyncOrchestrationService');

  final List<OfflineFirstRepository> _repositories;
  final ConnectivityService _connectivity;
  final NotifyService _notifyService;
  final int _maxRetries;

  Timer? _retryTimer;
  int _currentRetryAttempt = 0;
  bool _isSyncing = false;

  /// Whether we had dirty records that failed previously and have now recovered.
  bool _hadPendingFailures = false;

  /// Reactive sync state for UI binding.
  final ValueNotifier<SyncState> syncState = ValueNotifier(const SyncState());

  void _initialize() {
    _connectivity.isConnected.addListener(_onConnectivityChanged);
  }

  void _onConnectivityChanged() {
    if (_connectivity.isConnected.value) {
      _log.info('Connectivity restored — triggering sync');
      _cancelRetryTimer();
      _currentRetryAttempt = 0;
      syncAll();
    } else {
      _log.info('Connectivity lost');
      _cancelRetryTimer();
    }
  }

  /// Synchronizes all repositories.
  ///
  /// Returns `true` if all repos synced successfully, `false` otherwise.
  Future<bool> syncAll() async {
    if (_isSyncing) {
      _log.fine('Sync already in progress, skipping');
      return false;
    }

    if (!_connectivity.isConnected.value) {
      _log.fine('No connectivity, skipping sync');
      return false;
    }

    _isSyncing = true;
    syncState.value = syncState.value.copyWith(status: SyncStatus.syncing);

    var pendingBeforeSync = 0;
    for (final repo in _repositories) {
      try {
        pendingBeforeSync += await repo.getDirtyCount();
      } catch (_) {}
    }

    var allSucceeded = true;
    String? lastErrorMessage;

    for (final repo in _repositories) {
      try {
        await repo.syncWithRemote();
      } catch (e) {
        allSucceeded = false;
        lastErrorMessage = e.toString();
        _log.warning('Sync failed for ${repo.runtimeType}: $e');
      }
    }

    // Calculate pending dirty count across all repos.
    var totalPending = 0;
    for (final repo in _repositories) {
      try {
        totalPending += await repo.getDirtyCount();
      } catch (_) {}
    }

    _isSyncing = false;

    if (allSucceeded) {
      _currentRetryAttempt = 0;
      _cancelRetryTimer();

      syncState.value = SyncState(
        status: SyncStatus.succeeded,
        pendingCount: totalPending,
      );

      final clearedPendingChanges = pendingBeforeSync > 0 && totalPending == 0;

      if (_hadPendingFailures || clearedPendingChanges) {
        _hadPendingFailures = false;
        _notifyService.setToastEvent(
          ToastEventSuccess(message: 'All your data is synced now'),
        );
        _log.info('Sync recovered — all changes synced');
      }
    } else {
      _currentRetryAttempt++;
      _hadPendingFailures = true;

      syncState.value = SyncState(
        status: SyncStatus.failed,
        pendingCount: totalPending,
        failedAttempts: _currentRetryAttempt,
        lastError: lastErrorMessage,
      );

      if (_currentRetryAttempt >= _maxRetries) {
        _notifyService.setToastEvent(
          ToastEventError(
            message:
                'Sync failed after $_maxRetries attempts. '
                'Changes are saved locally.',
          ),
        );
        _log.severe(
          'Sync failed after $_maxRetries attempts: $lastErrorMessage',
        );
        // Reset for next manual/connectivity trigger.
        _currentRetryAttempt = 0;
      } else {
        _scheduleRetry();
      }
    }

    return allSucceeded;
  }

  /// Schedules a retry with exponential backoff.
  ///
  /// Delay pattern: 5s, 10s, 20s, 40s (base * 2^attempt).
  void _scheduleRetry() {
    final delay = Duration(seconds: 5 * (1 << (_currentRetryAttempt - 1)));
    _log.info('Scheduling retry #$_currentRetryAttempt in ${delay.inSeconds}s');
    _cancelRetryTimer();
    _retryTimer = Timer(delay, syncAll);
  }

  void _cancelRetryTimer() {
    _retryTimer?.cancel();
    _retryTimer = null;
  }

  void dispose() {
    _connectivity.isConnected.removeListener(_onConnectivityChanged);
    _cancelRetryTimer();
    syncState.dispose();
  }
}
