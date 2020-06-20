import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/logic/models/channel.dart';
import 'package:philips_remote/screens/content/channel_list_screen_model.dart';
import 'package:philips_remote/widgets/list_item.dart';
import 'package:philips_remote/widgets/control_button.dart';
import 'package:philips_remote/widgets/my_platform_circular_progress_indicator.dart';

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
    _scrollController.addListener(() {
      if (!_model.isSearching && _scrollController.offset < -100) {
        setState(() {
          _model.isSearching = !_model.isSearching;
        });
        _searchFieldFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _searchFieldFocusNode.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
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
      body: FutureBuilder<List<Channel>>(
        future: _model.channelList,
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
                itemCount: _model.currentChannelList.length,
                itemBuilder: (context, index) {
                  final item = _model.currentChannelList[index];
                  return ListItem(
                    data: item,
                    onTap: () => _model.changeToChannel(item),
                    imageCacheManager: _model.imageCacheManager,
                  );
                },
                controller: _scrollController,
              );
          }
          return null; // unreachable
        }),
      ),
    );
  }
}
