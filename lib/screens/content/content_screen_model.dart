import 'dart:async';

import 'package:flutter/material.dart' hide ConnectionState;
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/logic/services/connection/connection_resumer.dart';
import 'package:phimote/widgets/message.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

class ContentScreenModel with ChangeNotifier {
  ConnectionResumer _connectionResumer;

  StreamController<Message> _streamController = StreamController();

  Stream<Message> get messageStream => _streamController.stream;

  Stream<bool> get connectedStream => _connectionResumer.connectionState
      .map((state) => state == ConnectionState.connected);

  Locator locator;

  ContentScreenModel(this.locator) {
    _connectionResumer = ConnectionResumer(locator);

    _init();
  }

  void dispose() {
    super.dispose();
    _connectionResumer.dispose();
  }

  _init() {
    final stream =
        _connectionResumer.connectionState.map((state) => state.message);
    _streamController.addStream(stream);

    _updateWakelock();
  }

  resume() async {
    await _connectionResumer.resume();

    _updateWakelock();
  }

  _updateWakelock() async {
    final store = PreferenceStore();
    final keep = await store.keepScreenOn;

    Wakelock.toggle(enable: keep);
  }
}

extension ConnectionStateExt2 on ConnectionState {
  // ignore: missing_return
  Message get message {
    switch (this) {
      case ConnectionState.connected:
        return Message(
          icon: Icons.wifi,
          message: this.displayMessage,
          hidesAfter: Duration(seconds: 2),
        );
      case ConnectionState.notOnWifi:
        return Message(
          icon: Icons.wifi_off,
          message: this.displayMessage,
        );
      case ConnectionState.searchingForTv:
        return Message(
          icon: Icons.perm_scan_wifi,
          message: this.displayMessage,
          showLoading: true,
        );
      case ConnectionState.tvNotFound:
        return Message(
          icon: Icons.tv_off,
          message: this.displayMessage,
        );
      case ConnectionState.unknown:
        return Message(
          icon: Icons.warning,
          message: this.displayMessage,
        );
    }
  }
}
