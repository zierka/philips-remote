import 'dart:async';

import 'package:flutter/material.dart' hide ConnectionState;
import 'package:phimote/logic/services/connection/connection_resumer.dart';
import 'package:phimote/widgets/message.dart';

class ContentScreenModel {
  ConnectionResumer _connectionResumer = ConnectionResumer();

  StreamController<Message> _streamController = StreamController();

  Stream<Message> get messageStream => _streamController.stream;

  ContentScreenModel();

  void dispose() {
    _streamController.close();
  }

  resume() async {
    final state = await _connectionResumer.resume();
    final message = state.message;

    _streamController.add(message);
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
