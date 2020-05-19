import 'package:philips_remote/logic/models/auth/pair_response.dart';
import 'dart:convert' as convert;
import 'package:crypto/crypto.dart';

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
      "device": pairResponse.request.deviceSpec,
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
