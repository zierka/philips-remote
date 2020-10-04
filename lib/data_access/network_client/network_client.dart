import 'dart:async';

import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/pigeon.dart';

class _HttpMethod {
  static final get = "get";
  static final post = "post";
}

/// networking functions through platform channels
class NetworkClient implements NetworkChannelApiResponse {
  static final _channelApi = NetworkChannelApiRequest();
  static final _resultHandlers = Map<int, Completer<ChannelResponse>>();

  Session session;

  NetworkClient() {
    _init();
  }

  NetworkClient.withSession(this.session) {
    _init();
  }

  _init() {
    NetworkChannelApiResponse.setup(this);
  }

  @override
  void onResult(ChannelResponse arg) {
    final completer = _resultHandlers[arg.id];

    completer.complete(arg);

    _resultHandlers.remove(arg.id);
  }

  Future<Response> get(String url) async {
    final request = _makeRequestSkeleton();
    request.method = _HttpMethod.get;

    request.payload.url = url;

    final response = await _handleRequest(request);

    return _handleResponse(response);
  }

  Future<Response> post(String url, [Map<String, dynamic> json]) async {
    final request = _makeRequestSkeleton();
    request.method = _HttpMethod.post;

    request.payload.url = url;
    request.payload.body = convert.json.encode(json);

    final response = await _handleRequest(request);

    return _handleResponse(response);
  }

  ChannelRequest _makeRequestSkeleton() {
    final request = ChannelRequest();
    request.id = DateTime.now().millisecondsSinceEpoch;

    final credential = Credential();

    if (session != null && session.credential != null) {
      credential
        ..username = session.credential.username
        ..password = session.credential.password;
    }

    final payload = RequestPayload();

    payload.credential = credential;

    request.payload = payload;

    return request;
  }

  Future<ChannelResponse> _handleRequest(ChannelRequest request) async {
    await _channelApi.sendRequest(request);

    final completer = Completer<ChannelResponse>();
    _resultHandlers[request.id] = completer;

    final response = await completer.future;

    return response;
  }

  Response _handleResponse(ChannelResponse response) {
    if (response.status == "failure") throw (response.error);

    final responseBody = response.result;
    Response _response = Response.bytes(responseBody, 200);

    return _response;
  }
}
