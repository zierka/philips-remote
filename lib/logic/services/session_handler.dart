import 'package:get_it/get_it.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/main/app_state.dart';
import 'package:phimote/logic/models/auth/session.dart';

import 'service_registrator.dart';
import 'system_repository.dart';

class SessionHandler {
  AppState state;

  SessionHandler() {
    state = AppState.loading();
  }

  Future<void> resumeSession() async {
    final session = await _loadSession();

    if (session != null) {
      // make a reques to the system api to see if connection is ok
      final success = await _loadSystemInfo(session);

      if (success) {
        print(">> success");
        // do nothing, connection is ok
      } else {
        print(">> failure");
        // handle connection failure

        // possible causes:
        // - tv ip changed
        // - not connected to local network
      }
    } else {
      // do nothing
    }
  }

  Future<Session> _loadSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    if (session?.tv != null) {
      print(">> loaded session from local store. tv ip ${session.tv.ip}");

      state = AppState.content(session.tv);

      ServiceRegistrator.registerSessionServices(session);

      return session;
    } else {
      print(">> no session found");

      state = AppState.landing();

      return null;
    }
  }

  Future<bool> _loadSystemInfo(Session session) async {
    final systemRepo = GetIt.instance.get<SystemRepository>();

    try {
      await systemRepo.system();
      return true;
    } catch (e) {
      return false;
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
