import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// Monitors network connectivity and exposes reactive state.
///
/// Wraps `connectivity_plus` to provide a simple `ValueNotifier<bool>`
/// indicating whether the device has any active network connection.
class ConnectivityService {
  ConnectivityService({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity() {
    _initialize();
  }

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// Whether the device currently has a network connection.
  final ValueNotifier<bool> isConnected = ValueNotifier(true);

  void _initialize() {
    // Check initial status.
    _connectivity.checkConnectivity().then(_handleConnectivityChange);

    // Listen for ongoing changes.
    _subscription = _connectivity.onConnectivityChanged.listen(
      _handleConnectivityChange,
    );
  }

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    final connected = results.any((r) => r != ConnectivityResult.none);
    isConnected.value = connected;
  }

  /// On-demand connectivity check.
  Future<bool> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _handleConnectivityChange(results);
    return isConnected.value;
  }

  void dispose() {
    _subscription?.cancel();
    isConnected.dispose();
  }
}
