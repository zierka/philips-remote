import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/logic/services/image_cache_manager.dart';

class ListItemData {
  ListItemData(this._name, this._logoUrlEndpoint);

  String _name;
  String _logoUrlEndpoint;

  get name => _name;
  get logoUrlEndpoint => _logoUrlEndpoint;
}

class ListItem extends StatelessWidget {
  final ListItemData data;
  final VoidCallback onTap;
  final Widget trailing;
  final ImageCacheManager imageCacheManager;

  ListItem({
    this.data,
    this.onTap,
    this.trailing,
    this.imageCacheManager,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
      ),
      child: Material(
        child: Ink(
          // color: Colors.grey[800],
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.all(8),
              child: Text(data.name),
            ),
            trailing: this.trailing ??
                CachedNetworkImage(
                  imageUrl: data.logoUrlEndpoint,
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
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}