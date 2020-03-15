class PairResponse {
  int timestamp;
  String authKey;

  PairResponse.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'],
        authKey = json['auth_key'];
}
