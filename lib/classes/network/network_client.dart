import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

/// networking functions through platform channels
class NetworkClient {
  static const _networkMethodChannel =
      const MethodChannel('izerik.dev/network');

  static Future<Response> get(String url) async {
    final Map<String, String> payload = {
      "url": url,
    };

    final result = _networkMethodChannel.invokeMethod<Map>("get", payload);

    return _handleResult(result);
  }

  static Future<Response> post(String url, [Map<String, dynamic> json]) async {
    final body = convert.json.encode(json);

    final Map<String, String> payload = {
      "url": url,
      "body": body,
    };

    final result = _networkMethodChannel.invokeMethod("post", payload);

    return _handleResult(result);
  }

  static Future<Response> _handleResult(Future<dynamic> result) {
    return result.then((value) {
      if (value["status"] == "failure") throw (value["error"]);

      final responseBody = value["result"];
      Response response = Response.bytes(responseBody, 200);

      return Future.value(response);
    });
  }
}
