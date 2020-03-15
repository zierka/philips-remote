import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/util/utils.dart';

class PairRequest {
  TV tv;
  String ip;
  Map<String, dynamic> data;

  PairRequest({TV tv}) {
    this.tv = tv;
    this.ip = tv.ip;
    this.data = _data();
  }

  Map<String, dynamic> _data() {
    Map<String, dynamic> data = {
      "scope": ["read", "write", "control"]
    };

    data["device"] = deviceSpec;

    return data;
  }

  static Map<String, String> deviceSpec() {
    final deviceId = Utils.randomString(length: 16);

    // Keystore.instance.user = deviceId;

    Map<String, String> deviceSpec = {
      "device_name": "heliotrope",
      "device_os": "Android",
      "app_name": "Rhemote",
      "type": "native",
      "app_id": "app.id",
      "id": deviceId,
    };

    return deviceSpec;
  }
}
