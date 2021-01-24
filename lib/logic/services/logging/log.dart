import 'package:let_log/let_log.dart' as thirdParty;

class Log {
  Log._();

  static Future configure() async {
    thirdParty.Logger.config.reverse = true;
  }

  static void d(dynamic m) => thirdParty.Logger.debug(m);
  static void w(dynamic m) => thirdParty.Logger.warn(m);
  static void e(dynamic m) => thirdParty.Logger.error(m);

  static void net(String endpoint, dynamic data) =>
      thirdParty.Logger.net(endpoint, data: data);

  static void endNet(String endpoint, int status, dynamic data) =>
      thirdParty.Logger.endNet(endpoint, status: status, data: data);
}
