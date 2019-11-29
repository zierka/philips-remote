import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/commands.dart';
import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/network/remote_client.dart';

class ChannelItem extends StatelessWidget {
  final Channel channel;

  ChannelItem({this.channel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.all(8),
        child: Text(channel.name),
      ),
      onTap: () {
        Commands.changeToChannel(channel);
      },
    );
  }
}
