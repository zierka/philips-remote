import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:phimote/logic/models/auth/session.dart';

/// networking functions through platform channels
class NetworkClient {
  static const _networkMethodChannel =
      const MethodChannel('izerik.dev/network');

  Session session;

  NetworkClient();

  NetworkClient.withSession(this.session);

  Future<Response> get(String url) async {
    final Map<String, dynamic> payload = {
      "url": url,
    };

    if (session != null && session.credential != null) {
      payload["credential"] = session.credential.toJson();
    }

    print(
        ">> [NetworkClient] GET $url, credentials set ${payload["credentials"] == null ? "no" : "yes"}");

    final result = _networkMethodChannel.invokeMethod<Map>("get", payload);

    return _handleResult(result);
  }

  Future<Response> post(String url, [Map<String, dynamic> json]) async {
    final body = convert.json.encode(json);
    final Map<String, dynamic> payload = {
      "url": url,
      "body": body,
    };

    if (session != null && session.credential != null) {
      payload["credential"] = session.credential.toJson();
    }

    print(
        ">> [NetworkClient] POST $url, credentials set ${payload["credential"] == null ? "no" : "yes"}");

    final result = _networkMethodChannel.invokeMethod("post", payload);

    return _handleResult(result);
  }

  Future<Response> _handleResult(Future<dynamic> result) async {
    final value = await result;

    if (value["status"] == "failure") throw (value["error"]);

    final responseBody = value["result"];
    Response response = Response.bytes(responseBody, 200);

    return response;
  }
}
