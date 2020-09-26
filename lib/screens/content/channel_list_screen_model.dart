import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:philips_remote/logic/models/channel.dart';
import 'package:philips_remote/logic/services/image_cache_manager.dart';
import 'package:philips_remote/logic/services/commands_repository.dart';
import 'package:philips_remote/logic/services/info_repository.dart';
import 'package:philips_remote/widgets/widget_state_builder/widget_load_state.dart';

class ChannelListScreenModel {
  final _infoRepo = GetIt.instance.get<InfoRepository>();
  final _commandsRepo = GetIt.instance.get<CommandsRepository>();
  final imageCacheManager = GetIt.instance.get<ImageCacheManager>();

  final StreamController _loadStateStreamController =
      StreamController<WidgetLoadState>();

  Stream get loadState => _loadStateStreamController.stream;

  List<Channel> channelList;

  // List<Channel> _fullChannelList;
  // List<Channel> currentChannelList;

  var isSearching = false;

  ChannelListScreenModel() {
    // channelList = _channelList();
    // _fullChannelList = [];
    // currentChannelList = [];

    // channelList.then((channels) {
    //   _fullChannelList = channels;
    //   currentChannelList = channels;
    // });
    _loadData();
  }

  _loadData() async {
    _loadStateStreamController.add(WidgetLoadState.loading());

    final channels = await _infoRepo.channelList();

    channelList = channels;

    _loadStateStreamController.add(WidgetLoadState.content());
  }

  reloadData() async {
    _loadData();
  }

  search(String query) {
    // currentChannelList = _fullChannelList.where((channel) {
    //   return channel.name.contains(query);
    // });
  }

  // Future<List<Channel>> _channelList() {
  //   return;
  // }

  changeToChannel(Channel channel) {
    _commandsRepo.changeToChannel(channel);
  }
}
