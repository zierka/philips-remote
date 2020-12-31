import 'package:flutter/material.dart';
import 'package:phimote/screens/content/channel_list/channel_list_screen_model.dart';
import 'package:phimote/widgets/list_item.dart';
import 'package:phimote/widgets/navigation_bar.dart';
import 'package:phimote/widgets/widget_state_builder/widget_state_builder.dart';

class ChannelListScreen extends StatefulWidget {
  @override
  _ChannelListScreenState createState() => _ChannelListScreenState();
}

class _ChannelListScreenState extends State<ChannelListScreen> {
  final _model = ChannelListScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        title: Text("Channels"),
      ),
      body: WidgetStateBuilder(
          stream: _model.loadState,
          onRetry: _model.reloadData,
          builder: (context) {
            return ListView.builder(
              itemCount: _model.channelList.length,
              itemBuilder: (context, index) {
                final item = _model.channelList[index];
                return ListItem(
                  data: item,
                  onTap: () => _model.changeToChannel(item),
                  imageCacheManager: _model.imageCacheManager,
                );
              },
            );
          }),
    );
  }
}
