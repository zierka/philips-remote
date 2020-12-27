import 'package:flutter/foundation.dart';
import 'package:phimote/logic/models/application.dart';
import 'package:phimote/logic/models/channel.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/pigeon.dart';

class CommandsRepository {
  EndpointNetworkClient _client;

  CommandsRepository(this._client);

  Future<void> postKey(InputKey key) async {
    final endpoint = "input/key";

    final keyName = key.toString().split(".").last ?? key;

    debugPrint(">> post key $keyName");

    Map<String, String> json = {
      "key": keyName,
    };

    await _client.post(endpoint, json: json);
  }

  /// POST audio/volume
  Future<void> changeVolume(int value, {bool mute = false}) async {
    final endpoint = "audio/volume";
    Map<String, dynamic> json = {"current": value, "muted": mute};

    await _client.post(endpoint, json: json);

    return Future.value(null);
  }

  /// switch to channel
  /// POST /6/activities/tv {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  void changeToChannel(Channel channel) async {
    final endpoint = "activities/tv";

    Map<String, dynamic> json = {
      "channelList": {"id": "all"},
      "channel": {"ccid": channel.ccid},
    };

    await _client.post(endpoint, json: json);
  }

  /// open application
  /// POST /6/activities/launch {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  void openApplication(Application application) async {
    final endpoint = "activities/launch";

    Map<String, dynamic> json = application.toJson();

    await _client.post(endpoint, json: json);
  }

  void powerOn() async {
    final endpoint = "apps/ChromeCast";

    final options = RequestOptions();
    options.protocol = "http";
    options.port = 8008;

    await _client.post(endpoint, options: options);
  }

  void powerOnSetting() async {
    final endpoint = "menuitems/settings/update";

    Map<String, dynamic> json = {
      "values": [
        {
          "value": {
            "Nodeid": 2131230736,
            "data": {"selected_item": 1}
          }
        }
      ]
    };

    await _client.post(endpoint, json: json);
  }

  void sendText(
    String text, {
    bool search = false,
  }) async {
    final endpoint = "input/textentry";

    Map<String, dynamic> json = {
      "currentstring": text,
    };

    if (search) {
      json["action_id"] = "IME_ACTION_SEARCH";
    }

    await _client.post(endpoint, json: json);
  }
}
