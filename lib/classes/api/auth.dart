import 'package:philips_remote/classes/network/remote_client.dart';
import 'package:philips_remote/classes/store/keystore.dart';
import 'package:philips_remote/classes/utils.dart';
import 'dart:convert' as convert;
import 'package:crypto/crypto.dart';

import 'api.dart';

Keystore _keystore = Keystore.instance;

class AuthService {
  static Future<PairResponse> pair() {
    final data = _data();

    final request = PairRequest(ip: Keystore.instance.ip, data: data);

    return pairRequest(request);
  }

  static Map<String, dynamic> _data() {
    Map<String, dynamic> data = {
      "scope": ["read", "write", "control"]
    };

    data["device"] = device;

    return data;
  }

  static Map<String, String> device = _deviceSpec();

  static Map<String, String> _deviceSpec() {
    final deviceId = Utils.randomString(length: 16);

    _keystore.user = deviceId;

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

  // POST `https://192.168.1.4:1926/6/pair/request`

  static Future<PairResponse> pairRequest(PairRequest request) async {
    final url = API.baseUrl + "pair/request";

    print("PAIR REQUEST: $url");

    final responseJson = await RemoteClient.post(url, request.data);

    // print("PAIR RESPONSE: ${response.body}");

    // final json = convert.json.decode(response.body);

    if (responseJson["error_id"] == "SUCCESS") {
      print("success");

      final response = PairResponse.fromJson(responseJson);

      Keystore.instance.pass = response.authKey;
      RemoteClient.addCredentials(_keystore.user, _keystore.pass);

      return response;
    } else {
      print("error");

      throw ("");
    }
  }

  // POST `https://192.168.1.4:1926/6/pair/grant`

  static Future<void> confirmPair(ConfirmPairRequest request) async {
    final url = API.baseUrl + "pair/grant";
    print("CONFIRM PAIR REQUEST: $url");

    final responseJson = await RemoteClient.post(url, request.data);

    print("confirm pair response $responseJson");
  }
}

// MODELS

class PairRequest {
  String ip = Keystore.instance.ip;
  Map<String, dynamic> data;

  PairRequest({this.ip, this.data});
}

class PairResponse {
  int timestamp;
  String authKey;

  PairResponse.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'],
        authKey = json['auth_key'];
}

class ConfirmPairRequest {
  PairResponse pairResponse;

  Map<String, dynamic> data;

  ConfirmPairRequest(PairResponse pairResponse, String pin) {
    final Map<String, dynamic> auth = {
      "auth_AppId": "1",
      "pin": pin,
      "auth_timestamp": pairResponse.timestamp.toString(),
    };

    auth["auth_signature"] = _signature(pairResponse.timestamp, pin);

    final Map<String, dynamic> grantRequest = {
      "auth": auth,
      "device": AuthService.device,
    };

    this.pairResponse = pairResponse;

    data = grantRequest;
  }

  // create_signature(b64decode(secret_key), str(auth_Timestamp).encode() + str(pin).encode())
  static String _signature(int timestamp, String pin) {
    // Key used for generated the HMAC signature
    final secretKey =
        "JCqdN5AcnAHgJYseUn7ER5k3qgtemfUvMRghQpTfTZq7Cvv8EPQPqfz6dDxPQPSu4gKFPWkJGw32zyASgJkHwCjU";

    final secretKeyDecoded =
        convert.Base64Decoder().convert(secretKey).toString();

    String secret = secretKeyDecoded;
    String message = timestamp.toString() + pin;

    final secretBytes = convert.Utf8Encoder().convert(secret);
    final messageBytes = convert.Utf8Encoder().convert(message);

    var hmac = new Hmac(sha1, secretBytes);
    var digest = hmac.convert(messageBytes);
    var digestString = digest.toString();
    final digestString1 = convert.utf8.encode(digestString);
    final signature = convert.Base64Encoder().convert(digestString1);

    return signature;
  }
}
