import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/main/app_state.dart';
import 'package:phimote/logic/models/auth/session.dart';

import 'service_registrator.dart';

class SessionHandler {
  AppState state;

  SessionHandler() {
    state = AppState.loading();
  }

  Future<void> loadSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    if (session != null && session.tv != null) {
      print(">> loaded session from local store. tv ip ${session.tv.ip}");

      state = AppState.content(session.tv);

      ServiceRegistrator.registerSessionServices(session);
    } else {
      print(">> no session found");

      state = AppState.landing();
    }
  }

  setSession(Session session) async {
    print(">> setting session. tv ip ${session.tv.ip}");

    state = AppState.content(session.tv);

    final store = PreferenceStore();
    store.session = session;

    ServiceRegistrator.unregisterSessionServices();
    ServiceRegistrator.registerSessionServices(session);
  }

  clearSession() async {
    print(">> clear session");

    final store = PreferenceStore();
    store.session = null;

    ServiceRegistrator.unregisterSessionServices();

    state = AppState.landing();
  }
}
