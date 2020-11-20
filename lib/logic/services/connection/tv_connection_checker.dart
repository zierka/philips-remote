import 'package:get_it/get_it.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/logic/models/auth/session.dart';

import '../system_repository.dart';

class TvConnectionChecker {
  /// whether a connection can be established to the tv that's persisted
  Future<bool> check() async {
    final session = await _loadPersistedSession();

    // session.tv.ip = "192.168.100.168";

    // make a reques to the system api to see if connection is ok
    final success = await _loadSystemInfo(session);

    if (success) {
      print(">> success");
      // do nothing, connection is ok

      return true;
    } else {
      print(">> failure");
      // handle connection failure

      // possible causes:
      // - to handle:
      //   - tv ip changed
      // - not handled:
      //   - not connected to local network

      return false;
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
      await systemRepo.system(timeout: 1);
      return true;
    } catch (e) {
      print(">> ${e.toString}");
      return false;
    }
  }
}
