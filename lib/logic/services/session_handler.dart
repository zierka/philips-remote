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
    final session = await _loadPersistedSession();

    if (session?.tv != null) {
      print(">> loaded session from local store. tv ip ${session.tv.ip}");

      state = AppState.content(session.tv);

      ServiceRegistrator.registerSessionServices(session);

      session.tv.ip = "192.168.100.168";

      // make a reques to the system api to see if connection is ok
      final success = await _loadSystemInfo(session);

      if (success) {
        print(">> success");
        // do nothing, connection is ok
      } else {
        print(">> failure");
        // handle connection failure

        // possible causes:
        // - to handle:
        //   - tv ip changed
        // - not handled:
        //   - not connected to local network
      }
    } else {
      print(">> no session found");

      state = AppState.landing();
    }
  }

  Future<Session> _loadPersistedSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    return session;
  }

  Future<bool> _loadSystemInfo(Session session) async {
    final systemRepo = GetIt.instance.get<SystemRepository>();

    try {
      await systemRepo.system(timeout: 2);
      return true;
    } catch (e) {
      print(">> ${e.toString}");
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
