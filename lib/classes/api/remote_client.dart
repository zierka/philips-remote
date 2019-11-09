import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:http_auth/http_auth.dart';

class RemoteClient {
  static HttpClient _httpClient = _createHttpClient();
  static BaseClient client = _createClient();

  // Public

  static addCredentials(Uri uri, String username, String password) {
    print("add credentials URI $uri username $username password $password");

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
        (X509Certificate cert, String host, int port) => true;

    return httpClient;
  }

  static BaseClient _createClient() {
    return IOClient(_httpClient);
  }
}
