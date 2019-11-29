import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/get.dart';
import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/ui/components/channel_item.dart';

class ChannelsScreen extends StatefulWidget {
  @override
  _ChannelsScreenState createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends State<ChannelsScreen> {
  final _channelList = Get.channelList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channels"),
      ),
      body: FutureBuilder(
        future: _channelList,
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Awaiting result...');
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    return ChannelItem(channel: item);
                  });
          }
          return null; // unreachable
        }),
      ),
    );
  }
}
