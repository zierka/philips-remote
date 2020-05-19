import 'package:get_it/get_it.dart';
import 'package:philips_remote/logic/models/channel.dart';
import 'package:philips_remote/logic/services/image_cache_manager.dart';
import 'package:philips_remote/logic/services/commands_repository.dart';
import 'package:philips_remote/logic/services/info_repository.dart';

class ChannelListScreenModel {
  final _infoRepo = GetIt.instance.get<InfoRepository>();
  final _commandsRepo = GetIt.instance.get<CommandsRepository>();
  final imageCacheManager = GetIt.instance.get<ImageCacheManager>();

  Future<List<Channel>> channelList;

  List<Channel> _fullChannelList;
  List<Channel> currentChannelList;

  var isSearching = false;

  ChannelListScreenModel() {
    channelList = _channelList();
    _fullChannelList = [];
    currentChannelList = [];

    channelList.then((channels) {
      _fullChannelList = channels;
      currentChannelList = channels;
    });
  }

  search(String query) {
    currentChannelList = _fullChannelList.where((channel) {
      return channel.name.contains(query);
    });
  }

  Future<List<Channel>> _channelList() {
    return _infoRepo.channelList();
  }

  changeToChannel(Channel channel) {
    _commandsRepo.changeToChannel(channel);
  }
}
