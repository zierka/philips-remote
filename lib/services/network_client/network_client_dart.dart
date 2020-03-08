import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:http_auth/http_auth.dart';
import 'package:philips_remote/services/persistence/keystore.dart';
import 'dart:convert' as convert;

// native networking functions
class NetworkClientDart {
  static HttpClient _httpClient = _createHttpClient();
  static BaseClient _client = _createClient();

  static get client => _client;

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

    _client = DigestAuthClient(username, password, inner: _client);
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
}
