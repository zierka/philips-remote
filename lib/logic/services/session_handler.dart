import 'package:flutter/foundation.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/main/app_state.dart';
import 'package:phimote/logic/models/auth/session.dart';

import 'service_registrator.dart';

class SessionHandler {
  AppState state;

  SessionHandler() {
    state = AppState.loading();
  }

  Future<void> resumeSession() async {
    final session = await _loadPersistedSession();

    if (session?.tv != null) {
      debugPrint(">> loaded session from local store. tv ip ${session.tv.ip}");

      state = AppState.content(session.tv);

      ServiceRegistrator.registerSessionServices(session);
    } else {
      debugPrint(">> no session found");

      state = AppState.landing();
    }
  }

  Future<Session> _loadPersistedSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    return session;
  }

  setSession(Session session) async {
    debugPrint(">> setting session. tv ip ${session.tv.ip}");

    state = AppState.content(session.tv);

    final store = PreferenceStore();
    store.session = session;

    ServiceRegistrator.unregisterSessionServices();
    ServiceRegistrator.registerSessionServices(session);
  }

  clearSession() async {
    debugPrint(">> clear session");

    final store = PreferenceStore();
    store.session = null;

    ServiceRegistrator.unregisterSessionServices();

    state = AppState.landing();
  }
}
