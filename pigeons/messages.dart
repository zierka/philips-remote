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
  Error error;
}

class RequestPayload {
  String url;
  String body;
  Credential credential;
}

class RequestOptions {
  int timeout;
}

class Credential {
  String username;
  String password;
}

class Error {
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
