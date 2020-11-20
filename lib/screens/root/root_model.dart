import 'package:flutter/material.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/logic/services/service_registrator.dart';
import 'package:phimote/logic/services/session_handler.dart';
import 'package:phimote/main/app_state.dart';

class RootModel extends ChangeNotifier {
  final SessionHandler sessionHandler = SessionHandler();

  AppState get state => sessionHandler.state;

  RootModel() {
    ServiceRegistrator.registerGeneralServices();

    _init();
  }

  _init() async {
    await _loadSession();
  }

  Future<void> _loadSession() async {
    await sessionHandler.resumeSession();

    // add artificial delay to show loading. looks better :D
    await Future.delayed(Duration(seconds: 1), () => null);

    notifyListeners();
  }

  setSession(Session session) async {
    await sessionHandler.setSession(session);

    notifyListeners();
  }

  clearSession() async {
    sessionHandler.state = AppState.loading();

    notifyListeners();

    // add artificial delay to show loading. looks better :D
    await Future.delayed(Duration(seconds: 1), () => null);

    await sessionHandler.clearSession();

    notifyListeners();
  }
}
