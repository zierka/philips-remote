import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/screens/content/favorite_list_screen_model.dart';
import 'package:philips_remote/widgets/list_item.dart';
import 'package:philips_remote/widgets/my_platform_circular_progress_indicator.dart';

class FavoriteChannelListScreen extends StatefulWidget {
  @override
  _FavoriteChannelListScreenState createState() =>
      _FavoriteChannelListScreenState();
}

class _FavoriteChannelListScreenState extends State<FavoriteChannelListScreen> {
  final _model = FavoriteListScreenModel();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Favorite channels"),
      ),
      body: FutureBuilder(
        future: _model.favoriteChannelList(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: MyPlatformCircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    return ListItem(
                      data: item,
                      onTap: () => _model.changeToChannel(item),
                      imageCacheManager: _model.imageCacheManager,
                    );
                  });
          }
          return null; // unreachable
        }),
      ),
    );
  }
}
