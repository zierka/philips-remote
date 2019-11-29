import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/network/remote_client.dart';
import 'package:philips_remote/classes/api/auth.dart';
import 'dart:convert' as convert;

import 'api.dart';

class Commands {
  static void getVolume() {
    final url = API.baseUrl + "audio/volume";
    final response = RemoteClient.client.get(url);
  }

  static void postKeyStandby() {
    final url = API.baseUrl + "input/key";

    Map<String, String> json = {
      "key": "Standby",
    };

    final body = convert.json.encode(json);
    final response = RemoteClient.client.post(url, body: body);
  }

  // switch to channel
  // POST /6/activities/tv {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  static void changeToChannel(Channel channel) {
    final url = API.baseUrl + "activities/tv";

    Map<String, dynamic> json = {
      "channelList": {"id": "all"},
      "channel": {"ccid": channel.ccid},
    };

    final body = convert.json.encode(json);
    final response = RemoteClient.client.post(url, body: body);
  }
}
