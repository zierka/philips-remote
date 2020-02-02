import 'package:philips_remote/classes/store/keystore.dart';

class API {
  static final protocol = "https://";
  static final port = 1926;
  static final apiVersion = "6";
  static get ip => Keystore.instance.ip;

  static get baseUrl =>
      protocol + ip + ":" + port.toString() + "/" + apiVersion + "/";
}
