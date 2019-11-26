import 'package:flutter/material.dart';
import 'package:philips_remote/classes/models/channel.dart';

class ChannelItem extends StatelessWidget {
  final Channel channel;

  ChannelItem({this.channel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(channel.name),
    );
  }
}
