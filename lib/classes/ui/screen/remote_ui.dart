import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/commands.dart';
import 'package:philips_remote/classes/api/get.dart';
import 'package:philips_remote/classes/store/cache.dart';
import 'package:philips_remote/classes/ui/components/channel_item.dart';

class RemoteUI extends StatefulWidget {
  @override
  _RemoteUIState createState() => _RemoteUIState();
}

class _RemoteUIState extends State<RemoteUI> {
  final _channelList = Get.favoriteChannelList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote"),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: Cache.volume.current.toDouble(),
            min: Cache.volume.min.toDouble(),
            max: Cache.volume.max.toDouble(),
            onChanged: (value) {
              Commands.changeVolume(value.toInt());
            },
            // label: "Volume",
            // divisions: Cache.volume.max - Cache.volume.min,
          ),
        ],
      ),
    );
  }
}
