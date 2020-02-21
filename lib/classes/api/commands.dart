import 'dart:io';

import 'package:philips_remote/classes/models/application.dart';
import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/models/volume.dart';
import 'package:philips_remote/classes/network/remote_client.dart';
import 'dart:convert' as convert;

import 'api.dart';

class Commands {
  // change volume
  // POST audio/volume
  static void changeVolume(int value, {bool mute = false}) async {
    final url = API.baseUrl + "audio/volume";

    Map<String, dynamic> json = {"current": value, "muted": mute};

    final body = convert.json.encode(json);
    await RemoteClient.client.post(url, body: body);
    // final jsonResponse = convert.json.decode(response.body);
    // final volume = Volume.fromJson(jsonResponse);

    // return volume;
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
    RemoteClient.client.post(url, body: body);
  }

  // open application
  // POST /6/activities/launch {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  static void openApplication(Application application) {
    final url = API.baseUrl + "activities/launch";

    Map<String, dynamic> json = application.toJson();

    final body = convert.json.encode(json);
    RemoteClient.client.post(url, body: body);
  }

  static void powerOn() {
    final url = API.baseUrl + "/ChromeCast";

    // Map<String, dynamic> json = application.toJson();

    // Map<String, dynamic> json = {
    //   apps/ChromeCast"
    // };

    // final body = convert.json.encode(json);
    RemoteClient.client.post(url);
  }

  static void sendText(String text) {
    final url = API.baseUrl + "input/textentry";

    Map<String, dynamic> json = {
      "currentstring": text,
    };

    RemoteClient.post(url, json);
  }
}
