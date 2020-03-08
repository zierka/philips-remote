import 'package:philips_remote/data/models/application.dart';
import 'package:philips_remote/data/models/channel.dart';
import 'package:philips_remote/services/api/api.dart';
import 'package:philips_remote/services/network_client/network_client.dart';

class Commands {
  // change volume
  // POST audio/volume
  static Future<void> changeVolume(int value, {bool mute = false}) async {
    final url = API.baseUrl + "audio/volume";

    Map<String, dynamic> json = {"current": value, "muted": mute};

    await NetworkClient.post(url, json);

    return Future.value(null);
  }

  // switch to channel
  // POST /6/activities/tv {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  static void changeToChannel(Channel channel) async {
    final url = API.baseUrl + "activities/tv";

    Map<String, dynamic> json = {
      "channelList": {"id": "all"},
      "channel": {"ccid": channel.ccid},
    };

    await NetworkClient.post(url, json);
  }

  // open application
  // POST /6/activities/launch {"channelList":{"id":"allter"},"channel":{"ccid":338}}'
  static void openApplication(Application application) async {
    final url = API.baseUrl + "activities/launch";

    Map<String, dynamic> json = application.toJson();

    await NetworkClient.post(url, json);
  }

  static void powerOn() async {
    final url = API.baseUrl + "/ChromeCast";

    await NetworkClient.post(url);
  }

  static void sendText(String text) async {
    final url = API.baseUrl + "input/textentry";

    Map<String, dynamic> json = {
      "currentstring": text,
    };

    await NetworkClient.post(url, json);
  }
}
