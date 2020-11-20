import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/auth/session.dart';

import '../system_repository.dart';

class TvConnectionChecker {
  /// whether a connection can be established to the tv that's persisted
  Future<bool> check() async {
    // make a reques to the system api to see if connection is ok
    final success = await _loadSystemInfo();

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

    final systemRepo = GetIt.instance.get<SystemRepository>();
  Future<bool> _loadSystemInfo() async {

    try {
      await systemRepo.system(timeout: 1);
      return true;
    } catch (e) {
      print(">> ${e.toString}");
      return false;
    }
  }
}
