import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/channel.dart';
import 'package:philips_remote/services/api/get.dart';
import 'package:philips_remote/widgets/channel_item.dart';

class ChannelsScreen extends StatefulWidget {
  @override
  _ChannelsScreenState createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends State<ChannelsScreen> {
  final _channelListFuture = Get.channelList();
  List<Channel> _fullChannelList;
  List<Channel> _channelList;

  FocusNode _searchFieldFocusNode;
  ScrollController _scrollController;

  var _isSearching = false;

  @override
  void initState() {
    super.initState();

    _searchFieldFocusNode = FocusNode();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (!_isSearching && _scrollController.offset < -100) {
        setState(() {
          _isSearching = !_isSearching;
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
    return Scaffold(
      appBar: AppBar(
        title: AnimatedCrossFade(
          firstChild: TextField(
            decoration: InputDecoration(hintText: "Search..."),
            focusNode: _searchFieldFocusNode,
            onChanged: (string) {
              setState(() {
                _channelList = _fullChannelList.where((channel) {
                  return channel.name.contains(string);
                });
              });
            },
          ),
          secondChild: Text("Channels"),
          crossFadeState: _isSearching
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 100),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });

              if (_isSearching) {
                _searchFieldFocusNode.requestFocus();
              } else {
                _searchFieldFocusNode.unfocus();
              }
            },
          )
        ],
      ),
      body: FutureBuilder<List<Channel>>(
        future: _channelListFuture,
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Awaiting result...');
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              _channelList = snapshot.data;
              _fullChannelList = _channelList;
              return ListView.builder(
                itemCount: _channelList.length,
                itemBuilder: (context, index) {
                  final item = _channelList[index];
                  return ChannelItem(channel: item);
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
