import 'package:flutuate_mixpanel/flutuate_mixpanel.dart';

const String _apiKey = "<redacted>";

class Analytics {
  static MixpanelAPI _instance;

  static Future configure() async {
    _instance = await MixpanelAPI.getInstance(_apiKey);
  }

  static void track(String eventName, {Map<String, dynamic> properties}) {
    _instance.track(eventName, properties);
  }
}
