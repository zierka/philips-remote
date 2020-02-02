import 'dart:convert' as convert;

import 'package:philips_remote/classes/api/api.dart';
import 'package:philips_remote/classes/network/remote_client.dart';

enum InputKey {
  Standby,
  Back,
  Find,
  RedColour,
  GreenColour,
  YellowColour,
  BlueColour,
  Home,
  VolumeUp,
  VolumeDown,
  Mute,
  Options,
  Dot,
  Digit0,
  Digit1,
  Digit2,
  Digit3,
  Digit4,
  Digit5,
  Digit6,
  Digit7,
  Digit8,
  Digit9,
  Info,
  CursorUp,
  CursorDown,
  CursorLeft,
  CursorRight,
  Confirm,
  Next,
  Previous,
  Adjust,
  WatchTV,
  Viewmode,
  Teletext,
  Subtitle,
  ChannelStepUp,
  ChannelStepDown,
  Source,
  AmbilightOnOff,
  PlayPause,
  Play,
  Pause,
  FastForward,
  Stop,
  Rewind,
  Record,
  Online,
  // A,
  // KeyA,
  // ButtonA,
  // LetterA,
  // InputA,
  // ASDF,
}

class KeyInput {
  static void postKey(InputKey key) {
    final url = API.baseUrl + "input/key";

    final keyName = key.toString().split(".").last ?? key;

    print(">> post key $keyName");

    Map<String, String> json = {
      "key": keyName,
    };

    final body = convert.json.encode(json);
    RemoteClient.client.post(url, body: body);
  }
}