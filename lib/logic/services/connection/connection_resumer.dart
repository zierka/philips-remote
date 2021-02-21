import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:phimote/data_access/device_discovery/device_discovery.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/logic/services/connection/tv_connection_checker.dart';
import 'package:phimote/screens/root/root_model.dart';
import 'package:provider/provider.dart';

import 'tv_connection_checker.dart';
import 'wifi_connection_listener.dart';

class _Messages {
  _Messages._();

  static final connected = "Connected";
  static final notOnWifi = "You're not connected to your local network";
  static final reconnecting = "Reconnecting to tv...";
  static final tvNotFound = "TV not found / offline";
  static final unknown = "Unknown error";
}

enum ConnectionState {
  connected,
  tvNotFound,
  notOnWifi,
  searchingForTv,
  unknown
}

class ConnectionResumer {
  final WifiConnectionListener _wifiConnection = WifiConnectionListener();
  final TvConnectionChecker _tvConnection = TvConnectionChecker();

  StreamController<ConnectionState> _streamController =
      StreamController.broadcast();

  Stream<ConnectionState> get connectionState => _streamController.stream;

  Locator locator;

  ConnectionResumer(this.locator);

  void dispose() {
    _streamController.close();
  }

  Future<void> resume() async {
    final state = await _check();

    _streamController.add(state);

    if (state == ConnectionState.tvNotFound) {
      _streamController.add(ConnectionState.searchingForTv);

      final session = await _loadPersistedSession();

      final success = await _reconnect(session);

      if (success) {
        _streamController.add(ConnectionState.connected);
      } else {
        _streamController.add(ConnectionState.tvNotFound);
      }
    }
  }

  Future<ConnectionState> _check() async {
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

  Future<bool> _reconnect(Session session) async {
    DeviceDiscovery deviceDiscovery = GetIt.instance.get<DeviceDiscovery>();

    final tvs = await deviceDiscovery.getTVs();

    final matchingTv = tvs.firstWhere(
      (tv) => tv.friendlyName == session.tv.friendlyName,
      orElse: () => null,
    );

    if (matchingTv != null) {
      final updatedSession =
          Session(tv: matchingTv, credential: session.credential);
      final rootModel = locator<RootModel>();
      rootModel.setSession(updatedSession);
      return true;
    } else {
      return false;
    }
  }

  Future<Session> _loadPersistedSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    return session;
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
        return _Messages.reconnecting;
      case ConnectionState.tvNotFound:
        return _Messages.tvNotFound;
      case ConnectionState.unknown:
        return _Messages.unknown;
    }
  }
}
