import 'package:flutuate_mixpanel/flutuate_mixpanel.dart';
import 'package:phimote/pigeon.dart';

import 'log.dart';

const String _apiKey = "<redacted>";

class Analytics {
  static MixpanelAPI? _instance;

  static Future configure() async {
    _instance = await MixpanelAPI.getInstance(_apiKey);

    IOSMixpanelConfiguration().disableGeolocation();
  }

  static void track(String eventName, {Map<String, dynamic>? properties}) {
    _instance?.track(eventName, properties ?? {});

    if (properties == null) {
      Log.d("[Analytics] $eventName");
    } else {
      Log.d("[Analytics] $eventName | properties: $properties");
    }
  }
}
