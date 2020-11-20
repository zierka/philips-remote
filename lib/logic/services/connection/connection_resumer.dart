import 'package:phimote/logic/services/connection/tv_connection_checker.dart';

import 'tv_connection_checker.dart';
import 'wifi_connection_listener.dart';

class _Messages {
  static final connected = "Connected";
  static final notOnWifi = "You're not connected to your local network";
  static final searchingForTv = "Searching for tv...";
  static final tvNotFound = "TV not found";
  static final unknown = "Unknown error";
}

enum ConnectionState {
  connected,
  notOnWifi,
  searchingForTv,
  tvNotFound,
  unknown
}

class ConnectionResumer {
  final WifiConnectionListener _wifiConnection = WifiConnectionListener();
  final TvConnectionChecker _tvConnection = TvConnectionChecker();

  Future<ConnectionState> resume() async {
    final isConnectedToWifi = await _wifiConnection.isConnected;

    if (isConnectedToWifi) {
      final isConnectedToTv = await _tvConnection.check();

      if (isConnectedToTv) {
        return ConnectionState.connected;
      } else {
        return ConnectionState.tvNotFound;
      }
    } else {
      return ConnectionState.notOnWifi;
    }
  }
}

extension ConnectionStateExt on ConnectionState {
  // ignore: missing_return
  String get displayMessage {
    switch (this) {
      case ConnectionState.connected:
        return _Messages.connected;
      case ConnectionState.notOnWifi:
        return _Messages.notOnWifi;
      case ConnectionState.searchingForTv:
        return _Messages.searchingForTv;
      case ConnectionState.tvNotFound:
        return _Messages.tvNotFound;
      case ConnectionState.unknown:
        return _Messages.unknown;
    }
  }
}
