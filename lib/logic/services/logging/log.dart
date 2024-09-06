// import 'package:let_log/let_log.dart' as thirdParty;

import 'package:flutter/material.dart';

class Log {
  Log._();

  static Future configure() async {
    // thirdParty.Logger.config.reverse = true;
  }

  static void d(dynamic m) =>
      debugPrint(m); //thirdParty.Logger.debug(m, DateTime.now());
  static void w(dynamic m) =>
      debugPrint(m); //thirdParty.Logger.warn(m, DateTime.now());
  static void e(dynamic m) =>
      debugPrint(m); //thirdParty.Logger.error(m, DateTime.now());

  static void net(String endpoint, dynamic data) =>
      debugPrint('$endpoint: $data');
  // thirdParty.Logger.net(endpoint, data: data);

  static void endNet(String endpoint, int status, dynamic data) =>
      debugPrint('$endpoint: $data, status: $status');
  // thirdParty.Logger.endNet(endpoint, status: status, data: data);
}
