import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

abstract interface class NetworkManagerInterface {
  Future<bool> get hasInternetAccess;

  /// Exposes connectivity update events from the platform.
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkManager implements NetworkManagerInterface {
  final Connectivity _connectivity;
  NetworkManager(this._connectivity);

  @override
  Future<bool> get hasInternetAccess async => _checkhasInternetAccess();

  Future<bool> _checkhasInternetAccess() async {
    try {
      final result = await _connectivity.checkConnectivity();
      // If the connection is none or only bluetooth, then there is no internet connection.
      if (result.contains(ConnectivityResult.none) ||
          result.every((ele) => ele == ConnectivityResult.bluetooth)) {
        return false;
      }
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Exposes connectivity update events from the platform.
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;
}

// connectivity_plus: ^6.0.3