import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/screens/content/channel_list_screen_model.dart';
import 'package:phimote/widgets/list_item.dart';
import 'package:phimote/widgets/widget_state_builder/widget_state_builder.dart';

class ChannelListScreen extends StatefulWidget {
  @override
  _ChannelListScreenState createState() => _ChannelListScreenState();
}

class _ChannelListScreenState extends State<ChannelListScreen> {
  final _model = ChannelListScreenModel();

  FocusNode _searchFieldFocusNode;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _searchFieldFocusNode = FocusNode();

    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   if (!_model.isSearching && _scrollController.offset < -100) {
    //     setState(() {
    //       _model.isSearching = !_model.isSearching;
    //     });
    //     _searchFieldFocusNode.requestFocus();
    //   }
    // });
  }

  @override
  void dispose() {
    _searchFieldFocusNode.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedCrossFade(
          firstChild: PlatformTextField(
            // decoration: InputDecoration(hintText: "Search..."),
            focusNode: _searchFieldFocusNode,
            onChanged: (string) {
              setState(() {
                _model.search(string);
              });
            },
          ),
          secondChild: Text("Channels"),
          crossFadeState: _model.isSearching
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 100),
        ),
        // trailingActions: <Widget>[
        //   ControlButton(
        //     icon: Icon(_model.isSearching ? Icons.close : Icons.search),
        //     onPressed: () {
        //       setState(() {
        //         _model.isSearching = !_model.isSearching;
        //       });

        //       if (_model.isSearching) {
        //         _searchFieldFocusNode.requestFocus();
        //       } else {
        //         _searchFieldFocusNode.unfocus();
        //       }
        //     },
        //   )
        // ],
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
              controller: _scrollController,
            );
          }),
    );
  }
}
