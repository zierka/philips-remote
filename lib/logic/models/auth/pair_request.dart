import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/util/utils.dart';

class PairRequest {
  TV tv;
  String ip;
  Map<String, String> deviceSpec;
  Map<String, dynamic> data;

  String sessionUsername;

  PairRequest({TV tv}) {
    this.tv = tv;
    this.ip = tv.ip;

    final deviceId = Utils.randomString(length: 16);

    sessionUsername = deviceId;

    deviceSpec = {
      "device_name": "heliotrope",
      "device_os": "Android",
      "app_name": "Rhemote",
      "type": "native",
      "app_id": "app.id",
      "id": deviceId,
    };

    Map<String, dynamic> _data = {
      "scope": ["read", "write", "control"],
      "device": deviceSpec,
    };

    this.data = _data;
  }
}
