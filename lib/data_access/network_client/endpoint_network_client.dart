import 'package:http/http.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/data_access/network_client/network_client.dart';

class EndpointNetworkClient extends NetworkClient {
  EndpointNetworkClient(Session session) : super.withSession(session);

  @override
  Future<Response> get(String url) async {
    final _url = session.tv.baseUrl + url;

    return super.get(_url);
  }

  @override
  Future<Response> post(String url, [Map<String, dynamic> json]) async {
    final _url = session.tv.baseUrl + url;

    return super.post(_url, json);
  }
}
