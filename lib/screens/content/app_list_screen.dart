import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/application.dart';
import 'package:philips_remote/screens/content/app_list_model.dart';

class AppListScreen extends StatefulWidget {
  @override
  _AppListScreenState createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  final _model = AppListModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    return ListTile(
                      title: Text(item.label),
                      trailing: CachedNetworkImage(
                        imageUrl: item.logoUrlEndpoint,
                        cacheManager: _model.imageCacheManager,
                      ),
                      onTap: () {
                        _model.openApplication(item);
                      },
                    );
                  });
          }
          return null; // unreachable
        }),
      ),
    );
  }
}
