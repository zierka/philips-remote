import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/channel.dart';
import 'package:phimote/logic/services/image_cache_manager.dart';
import 'package:phimote/logic/services/commands_repository.dart';
import 'package:phimote/logic/services/info_repository.dart';
import 'package:phimote/widgets/widget_state_builder/widget_load_state.dart';

class ChannelListScreenModel {
  get _infoRepo => GetIt.instance.get<InfoRepository>();
  get _commandsRepo => GetIt.instance.get<CommandsRepository>();
  get imageCacheManager => GetIt.instance.get<ImageCacheManager>();

  final StreamController _loadStateStreamController =
      StreamController<WidgetLoadState>();

  Stream get loadState => _loadStateStreamController.stream;

  List<Channel> channelList;

  var isSearching = false;

  ChannelListScreenModel() {
    _loadData();
  }

  _loadData() async {
    _loadStateStreamController.add(WidgetLoadState.loading());

    try {
      final channels = await _infoRepo.channelList();
      channelList = channels;

      _loadStateStreamController.add(WidgetLoadState.content());
    } catch (e) {
      _loadStateStreamController
          .add(WidgetLoadState.error(ScreenError.apiException(e)));
    }
  }

  reloadData() async {
    _loadData();
  }

  search(String query) {}

  changeToChannel(Channel channel) {
    try {
      _commandsRepo.changeToChannel(channel);
    } catch (e) {
      //
    }
  }
}
