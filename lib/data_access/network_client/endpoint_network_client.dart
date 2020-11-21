import 'package:http/http.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/data_access/network_client/network_client.dart';
import 'package:phimote/pigeon.dart';

class EndpointNetworkClient extends NetworkClient {
  EndpointNetworkClient(Session session) : super.withSession(session);

  @override
  Future<Response> get(
    String url, {
    RequestOptions options,
  }) async {
    final _url = _fullUrl(url, options);

    return super.get(_url, options: options);
  }

  @override
  Future<Response> post(
    String url, {
    Map<String, dynamic> json,
    RequestOptions options,
  }) async {
    final _url = _fullUrl(url, options);

    return super.post(_url, json: json, options: options);
  }

  String _fullUrl(String endpoint, RequestOptions options) {
    var tv = session.tv.copyWith(
      protocol: options?.protocol,
      ip: options?.ip,
      apiVersion: options?.apiVersion,
      port: options?.port,
    );

    final _url = tv.baseUrl + endpoint;

    return _url;
  }
}
