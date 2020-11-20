import 'dart:async';

import 'package:flutter/material.dart' hide ConnectionState;
import 'package:phimote/logic/services/connection/connection_resumer.dart';
import 'package:phimote/widgets/message.dart';
import 'package:provider/provider.dart';

class ContentScreenModel {
  ConnectionResumer _connectionResumer;

  StreamController<Message> _streamController = StreamController();

  Stream<Message> get messageStream => _streamController.stream;

  Locator locator;

  ContentScreenModel(this.locator) {
    _connectionResumer = ConnectionResumer(locator);

    _init();
  }

  void dispose() {
    _connectionResumer.dispose();
  }

  _init() {
    final stream =
        _connectionResumer.connectionState.map((state) => state.message);
    _streamController.addStream(stream);
  }

  resume() async {
    await _connectionResumer.resume();
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
