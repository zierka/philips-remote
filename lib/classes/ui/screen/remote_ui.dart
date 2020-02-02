import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/commands.dart';
import 'package:philips_remote/classes/api/get.dart';
import 'package:philips_remote/classes/api/key_input.dart';
import 'package:philips_remote/classes/store/cache.dart';
import 'package:philips_remote/classes/ui/components/gesture_pad.dart';
import 'package:philips_remote/classes/ui/components/volume_control.dart';

class RemoteUI extends StatefulWidget {
  @override
  _RemoteUIState createState() => _RemoteUIState();
}

class _RemoteUIState extends State<RemoteUI> {
  final _channelList = Get.favoriteChannelList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote"),
      ),
      body: Column(
        children: <Widget>[
          // VolumeControl(),
          CupertinoButton(
            child: Text("Standby (on/off)"),
            onPressed: () {
              KeyInput.postKey(InputKey.Standby);
            },
          ),
          CupertinoButton(
            child: Text("Super turn ON"),
            onPressed: () {
              Commands.powerOn();
            },
          ),
          GesturePad(),
        ],
      ),
    );
  }
}
