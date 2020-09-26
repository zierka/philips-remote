import 'package:phimote/logic/models/application.dart';
import 'package:phimote/logic/models/channel.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';

class CommandsRepository {
  EndpointNetworkClient _client;

  CommandsRepository(this._client);

  void postKey(InputKey key) {
    final endpoint = "input/key";

    final keyName = key.toString().split(".").last ?? key;

    print(">> post key $keyName");

    Map<String, String> json = {
      "key": keyName,
    };

    _client.post(endpoint, json);
  }

  /// POST audio/volume
  Future<void> changeVolume(int value, {bool mute = false}) async {
    final endpoint = "audio/volume";
    Map<String, dynamic> json = {"current": value, "muted": mute};

    await _client.post(endpoint, json);

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

    await _client.post(endpoint, json);
  }

  /// open application
  /// POST /6/activities/launch {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  void openApplication(Application application) async {
    final endpoint = "activities/launch";

    Map<String, dynamic> json = application.toJson();

    await _client.post(endpoint, json);
  }

  void powerOn() async {
    final endpoint = "/ChromeCast";

    await _client.post(endpoint);
  }

  void sendText(String text) async {
    final endpoint = "input/textentry";

    Map<String, dynamic> json = {
      "currentstring": text,
    };

    await _client.post(endpoint, json);
  }
}
