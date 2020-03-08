import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/channel.dart';
import 'package:philips_remote/services/api/commands.dart';
import 'package:philips_remote/services/image_handling.dart';

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
      trailing: CachedNetworkImage(
        imageUrl: channel.logoUrl,
        cacheManager: CustomCacheManager(),
        imageBuilder: (context, imageProvider) => Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Image(
                image: imageProvider,
              ),
            ),
          ),
        ),
        fit: BoxFit.fill,
      ),
      onTap: () {
        Commands.changeToChannel(channel);
      },
    );
  }
}