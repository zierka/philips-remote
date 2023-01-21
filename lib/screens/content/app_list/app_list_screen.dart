import 'package:flutter/material.dart';
import 'package:phimote/logic/models/application.dart';
import 'package:phimote/screens/content/app_list/app_list_model.dart';
import 'package:phimote/widgets/list_item.dart';
import 'package:phimote/widgets/loading_indicator.dart';
import 'package:phimote/widgets/fixed_app_bar.dart';

class AppListScreen extends StatefulWidget {
  @override
  _AppListScreenState createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  final _model = AppListModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppBar(
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
                child: LoadingIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return ListItem(
                      data: ListItemData(item.label, item.logoUrlEndpoint),
                      onTap: () {
                        _model.openApplication(item);
                      },
                      imageCacheManager: _model.imageCacheManager,
                    );
                  });
          }
        }),
      ),
    );
  }
}
