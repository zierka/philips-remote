// import 'dart:io';
import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:http/io_client.dart';
// import 'package:http_auth/http_auth.dart';
// import 'package:philips_remote/classes/store/keystore.dart';
import 'dart:convert' as convert;

class RemoteClient {
  static const _networkMethodChannel =
      const MethodChannel('izerik.dev/network');

  // networking functions through platform channels

  static Future<Map<String, dynamic>> get(String url) async {
    final Map<String, String> payload = {
      "url": url,
    };

    final result = _networkMethodChannel.invokeMethod<Map>("get", payload);

    return _handleResult(result);
  }

  static Future<Map<String, dynamic>> post(String url,
      [Map<String, dynamic> json]) async {
    final body = convert.json.encode(json);

    final Map<String, String> payload = {
      "url": url,
      "body": body,
    };

    final result = _networkMethodChannel.invokeMethod("post", payload);

    return _handleResult(result);
  }

  static Future<Map<String, dynamic>> _handleResult(Future<dynamic> result) {
    return result.then((value) {
      if (value["status"] == "failure") throw (value["error"]);

      final responseBody = value["result"];
      final json = convert.json.decode(responseBody);

      return Future.value(json);
    });
  }

  // native networking functions

/*
  static HttpClient _httpClient = _createHttpClient();
  static BaseClient _client = _createClient();

  static Future<Map<String, dynamic>> get(String url) async {
    final response = await _client.get(url);
    final json = convert.json.decode(response.body);

    return json;
  }

  static Future<Map<String, dynamic>> post(String url,
      [Map<String, dynamic> json]) async {
    final body = convert.json.encode(json);

    final response = await _client.post(url, body: body);
    final responseJson = convert.json.decode(response.body);

    return responseJson;
  }

  static addCredentials(String username, String password) {
    print("add credentials username $username password $password");

    client = DigestAuthClient(username, password, inner: client);
  }

  static HttpClient _createHttpClient() {
    HttpClient httpClient = HttpClient();

    // for charles debugging

    // the ip is the charles computer one
    String proxy = Platform.isAndroid ? '192.168.1.4:8888' : 'localhost:8888';

    httpClient.findProxy = (uri) {
      return "PROXY $proxy;";
    };

    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      print(">> badCertificateCallback $cert $host $port");
      return true;
    };

    httpClient.maxConnectionsPerHost = 1;

    return httpClient;
  }

  static BaseClient _createClient() {
    BaseClient client1 = IOClient(_httpClient);

    if (Keystore.instance.user != null && Keystore.instance.pass != null) {
      client1 = DigestAuthClient(Keystore.instance.user, Keystore.instance.pass,
          inner: client1);
    }

    return client1;
  }
  */
}
