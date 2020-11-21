import 'package:pigeon/pigeon.dart';

class ChannelRequest {
  int id;
  String method;
  RequestPayload payload;
  RequestOptions options;
}

class ChannelResponse {
  int id;
  String status;
  Uint8List result;
  NetworkError error;
}

class RequestPayload {
  String url;
  String body;
  Credential credential;
}

class RequestOptions {
  int timeout;

  String protocol;
  String ip;
  int port;
  int apiVersion;
}

class Credential {
  String username;
  String password;
}

class NetworkError {
  String error;
  int code;
}

@HostApi()
abstract class NetworkChannelApiRequest {
  void sendRequest(ChannelRequest request);
}

@FlutterApi()
abstract class NetworkChannelApiResponse {
  void onResult(ChannelResponse response);
}
