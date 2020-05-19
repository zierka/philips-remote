import 'package:philips_remote/logic/models/auth/credential.dart';
import 'package:philips_remote/logic/models/auth/pair_request.dart';

class PairResponse {
  int timestamp;
  String authKey;

  PairRequest request;

  get credential =>
      Credential(username: request.sessionUsername, password: authKey);

  PairResponse.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'],
        authKey = json['auth_key'];
}
