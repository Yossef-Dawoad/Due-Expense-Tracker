import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:logging/logging.dart';

import '../config/locator_config.dart';
import '../core/abstractions/database_abstraction.dart';
import '../core/abstractions/logging_abstraction.dart';
import '../core/services/connectivity_service.dart';
import '../core/services/sync_orchestration_service.dart';
import '../core/services/transaction_service.dart';
import '../core/services/wallet_service.dart';
import '../core/utils/locator.dart';
import '../core/utils/internal_notification/notify_service.dart';
import '../core/utils/navigation/router_service.dart';

/// Represents different states of app initialization
sealed class AppState {
  const AppState();
}

class InitializingApp extends AppState {
  const InitializingApp();
}

class AppInitialized extends AppState {
  const AppInitialized();
}

class AppInitializationError extends AppState {
  final Object error;
  final StackTrace stackTrace;
  const AppInitializationError(this.error, this.stackTrace);
}

/// ViewModel responsible for handling app startup and initialization
class StartupViewModel {
  StartupViewModel({LoggingAbstraction? loggingAbstraction})
    : _loggingAbstraction = loggingAbstraction ?? LoggingAbstraction();

  final appStateNotifier = ValueNotifier<AppState>(const InitializingApp());

  final LoggingAbstraction _loggingAbstraction;
  StreamSubscription<LogRecord>? loggingSubscription;

  Future<void> initializeApp() async {
    appStateNotifier.value = const InitializingApp();
    try {
      if (!locator.isRegistered<RouterService>()) {
        locator.registerMany(modules);
      }
      _warmCriticalModules();
      loggingSubscription ??= _loggingAbstraction.initializeLogging();
      appStateNotifier.value = const AppInitialized();
    } catch (e, st) {
      appStateNotifier.value = AppInitializationError(e, st);
    }
  }

  void _warmCriticalModules() {
    locator<RouterService>();
    locator<NotifyService>();
    locator<OfflineDatabaseAbstraction>();
    locator<ConnectivityService>();
    locator<SyncOrchestrationService>();
    locator<WalletService>();
    locator<TransactionService>();
  }

  Future<void> retryInitialization() async {
    await loggingSubscription?.cancel();
    loggingSubscription = null;
    locator.reset();
    await initializeApp();
  }

  void dispose() {
    appStateNotifier.dispose();
    unawaited(loggingSubscription?.cancel());
  }
}
