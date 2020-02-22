import 'dart:io';

import 'package:philips_remote/classes/models/application.dart';
import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/models/volume.dart';
import 'package:philips_remote/classes/network/remote_client.dart';

import 'api.dart';

class Commands {
  // change volume
  // POST audio/volume
  static void changeVolume(int value, {bool mute = false}) async {
    final url = API.baseUrl + "audio/volume";

    Map<String, dynamic> json = {"current": value, "muted": mute};

    await RemoteClient.post(url, json);
    // final jsonResponse = convert.json.decode(response.body);
    // final volume = Volume.fromJson(jsonResponse);

    // return volume;
  }

  // switch to channel
  // POST /6/activities/tv {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  static void changeToChannel(Channel channel) async {
    final url = API.baseUrl + "activities/tv";

    Map<String, dynamic> json = {
      "channelList": {"id": "all"},
      "channel": {"ccid": channel.ccid},
    };

    await RemoteClient.post(url, json);
  }

  // open application
  // POST /6/activities/launch {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  static void openApplication(Application application) async {
    final url = API.baseUrl + "activities/launch";

    Map<String, dynamic> json = application.toJson();

    await RemoteClient.post(url, json);
  }

  static void powerOn() async {
    final url = API.baseUrl + "/ChromeCast";

    await RemoteClient.post(url);
  }

  static void sendText(String text) async {
    final url = API.baseUrl + "input/textentry";

    Map<String, dynamic> json = {
      "currentstring": text,
    };

    await RemoteClient.post(url, json);
  }
}
