import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/constants/ui_constants.dart';
import 'package:phimote/logic/services/image_cache_manager.dart';

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
          color: AppColors.backgroundColor,
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.all(Paddings.x1),
              child: Text(data.name),
            ),
            trailing: this.trailing, // ??
            //       CachedNetworkImage(
            //         imageUrl: data.logoUrlEndpoint,
            //         cacheManager: imageCacheManager,
            //         imageBuilder: (context, imageProvider) => Container(
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(16.0),
            //             child: Padding(
            //               padding: EdgeInsets.all(4),
            //               child: Image(
            //                 image: imageProvider,
            //               ),
            //             ),
            //           ),
            //         ),
            //         fit: BoxFit.fill,
            //       ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
