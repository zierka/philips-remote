import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/application.dart';
import 'package:philips_remote/services/api/commands.dart';
import 'package:philips_remote/services/api/get.dart';
import 'package:philips_remote/services/image_handling.dart';

class AppsScreen extends StatefulWidget {
  @override
  _AppsScreenState createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  final _channelList = Get.applicationList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applications"),
      ),
      body: FutureBuilder(
        future: _channelList,
        builder: ((context, AsyncSnapshot<List<Application>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Awaiting result...');
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    return ListTile(
                      title: Text(item.label),
                      trailing: CachedNetworkImage(
                        imageUrl: item.logoUrl,
                        cacheManager: CustomCacheManager(),
                      ),
                      onTap: () {
                        Commands.openApplication(item);
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
