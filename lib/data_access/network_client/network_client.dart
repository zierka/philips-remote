import 'dart:async';

import 'package:phimote/logic/services/logging/log.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/logic/services/api.dart';
import 'package:phimote/pigeon.dart';
import 'package:phimote/util/extensions/network_error.dart';

class _HttpMethod {
  static final get = "get";
  static final post = "post";
}

/// networking functions through platform channels
class NetworkClient implements NetworkChannelApiResponse {
  static final _channelApi = NetworkChannelApiRequest();
  static final _resultHandlers = Map<int, Completer<ChannelResponse>>();

  late Session session;

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
    final completer = _resultHandlers[arg.request?.id];

    completer?.complete(arg);

    _resultHandlers.remove(arg.request?.id);
  }

  /// Throws [ApiException]
  Future<Response> get(
    String url, {
    RequestOptions? options,
  }) async {
    final request = _makeRequestSkeleton(options: options);
    request.method = _HttpMethod.get;

    request.payload?.url = url;

    final response = await _handleRequest(request);

    try {
      return _handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  /// Throws [ApiException]
  Future<Response> post(
    String url, {
    Map<String, dynamic>? json,
    RequestOptions? options,
  }) async {
    final request = _makeRequestSkeleton(options: options);
    request.method = _HttpMethod.post;

    request.payload?.url = url;
    request.payload?.body = convert.json.encode(json);

    final response = await _handleRequest(request);

    try {
      return _handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  ChannelRequest _makeRequestSkeleton({RequestOptions? options}) {
    final request = ChannelRequest();
    request.id = DateTime.now().millisecondsSinceEpoch;

    final credential = Credential();

    if (session.credential != null) {
      credential
        ..username = session.credential!.username
        ..password = session.credential!.password;
    }

    final payload = RequestPayload();

    payload.credential = credential;

    request.payload = payload;

    if (options != null) {
      request.options = options;
    } else {
      final options = RequestOptions();
      options.timeout = 2;
      request.options = options;
    }

    return request;
  }

  Future<ChannelResponse> _handleRequest(ChannelRequest request) async {
    Log.net(request.payload!.url!, request.payload?.body);

    await _channelApi.sendRequest(request);

    final completer = Completer<ChannelResponse>();
    _resultHandlers[request.id!] = completer;

    final response = await completer.future;

    return response;
  }

  Response _handleResponse(ChannelResponse response) {
    if (response.error != null &&
        response.error!.error != null &&
        response.error!.error!.isNotEmpty) {
      Log.endNet(response.request!.payload!.url.toString(),
          response.error!.code!, response.error!.toString2());
      throw ApiException.error(response.error!);
    }

    final responseBody = response.result!;
    Response _response = Response.bytes(responseBody, 200);
    Log.endNet(response.request!.payload!.url.toString(), 200, _response.body);

    return _response;
  }
}
