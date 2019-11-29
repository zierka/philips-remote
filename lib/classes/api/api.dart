import 'package:philips_remote/classes/store/keystore.dart';

class API {
  static String _protocol = "https://";
  static String _port = "1926";
  static String _apiVersion = "6";
  static get _ip => Keystore.instance.ip;

  static get baseUrl => _protocol + _ip + ":" + _port + "/" + _apiVersion + "/";
}
