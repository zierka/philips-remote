import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/logic/models/channel.dart';
import 'package:philips_remote/logic/services/image_cache_manager.dart';

class ChannelItem extends StatelessWidget {
  final Channel channel;
  final VoidCallback onTap;
  final ImageCacheManager imageCacheManager;

  ChannelItem({
    this.channel,
    this.onTap,
    this.imageCacheManager,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.all(8),
        child: Text(channel.name),
      ),
      trailing: CachedNetworkImage(
        imageUrl: channel.logoUrlEndpoint,
        cacheManager: imageCacheManager,
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
      onTap: () => onTap,
    );
  }
}
