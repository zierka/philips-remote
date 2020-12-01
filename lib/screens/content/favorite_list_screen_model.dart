import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/channel.dart';
import 'package:phimote/logic/services/image_cache_manager.dart';
import 'package:phimote/logic/services/commands_repository.dart';
import 'package:phimote/logic/services/info_repository.dart';

class FavoriteListScreenModel {
  get _infoRepo => GetIt.instance.get<InfoRepository>();
  get _commandsRepo => GetIt.instance.get<CommandsRepository>();
  get imageCacheManager => GetIt.instance.get<ImageCacheManager>();

  Future<List<Channel>> favoriteChannelList() {
    return _infoRepo.favoriteChannelList();
  }

  changeToChannel(Channel channel) {
    _commandsRepo.changeToChannel(channel);
  }
}
