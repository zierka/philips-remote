import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:http_auth/http_auth.dart';
import 'package:philips_remote/classes/store/keystore.dart';
import 'dart:convert' as convert;

class RemoteClient {
  static HttpClient _httpClient = _createHttpClient();
  static BaseClient client = _createClient();

  // Public

  static addCredentials(String username, String password) {
    print("add credentials username $username password $password");

    client = DigestAuthClient(username, password, inner: client);
  }

  // PRIVATE

  static HttpClient _createHttpClient() {
    HttpClient httpClient = HttpClient();

    String proxy =
        Platform.isAndroid ? '<YOUR_LOCAL_IP>:8888' : 'localhost:8888';

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

  static post(String url, Map<String, dynamic> json) {
    final body = convert.json.encode(json);

    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.acceptEncodingHeader: "gzip, deflate",
      HttpHeaders.acceptHeader: "*/*",
    };

    client.post(url, body: body, headers: headers);
  }
}
