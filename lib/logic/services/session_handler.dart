import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/main/app_state.dart';
import 'package:phimote/logic/models/auth/session.dart';

import 'service_registrator.dart';

class SessionHandler {
  AppState state = AppState.loading();

  Future<void> resumeSession() async {
    final session = await _loadPersistedSession();

    if (session != null) {
      Log.d(">> loaded session from local store. tv ip ${session.tv.ip}");

      state = AppState.content(session.tv);

      ServiceRegistrator.registerSessionServices(session);
    } else {
      Log.d(">> no session found");

      state = AppState.landing();
    }
  }

  Future<Session?> _loadPersistedSession() async {
    final store = PreferenceStore();
    final session = await store.currentSession;

    return session;
  }

  setSession(Session session) async {
    Log.d(">> setting session. tv ip ${session.tv.ip}");

    state = AppState.content(session.tv);

    final store = PreferenceStore();
    store.session = session;

    ServiceRegistrator.unregisterSessionServices();
    ServiceRegistrator.registerSessionServices(session);
  }

  clearSession() async {
    Log.d(">> clear session");

    final store = PreferenceStore();
    store.session = null;

    ServiceRegistrator.unregisterSessionServices();

    state = AppState.landing();
  }
}
