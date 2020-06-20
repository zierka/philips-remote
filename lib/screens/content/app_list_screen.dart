import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/logic/models/application.dart';
import 'package:philips_remote/screens/content/app_list_model.dart';
import 'package:philips_remote/widgets/list_item.dart';
import 'package:philips_remote/widgets/my_platform_circular_progress_indicator.dart';

class AppListScreen extends StatefulWidget {
  @override
  _AppListScreenState createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  final _model = AppListModel();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Applications"),
      ),
      body: FutureBuilder(
        future: _model.applications(),
        builder: ((context, AsyncSnapshot<List<Application>> snapshot) {
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
                      data: ListItemData(item.label, item.logoUrlEndpoint),
                      onTap: () {
                        _model.openApplication(item);
                      },
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
