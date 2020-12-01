import 'package:get_it/get_it.dart';

import '../system_repository.dart';

class TvConnectionChecker {
  /// whether a connection can be established to the tv that's persisted
  Future<bool> check() async {
    // make a reques to the system api to see if connection is ok
    final success = await _loadSystemInfo();

    return success;
  }

  get _systemRepo => GetIt.instance.get<SystemRepository>();

  Future<bool> _loadSystemInfo() async {
    try {
      await _systemRepo.system(timeout: 1);
      return true;
    } catch (e) {
      return false;
    }
  }
}
