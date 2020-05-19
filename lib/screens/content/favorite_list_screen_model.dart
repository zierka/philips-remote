import 'package:get_it/get_it.dart';
import 'package:philips_remote/logic/models/channel.dart';
import 'package:philips_remote/logic/services/image_cache_manager.dart';
import 'package:philips_remote/logic/services/commands_repository.dart';
import 'package:philips_remote/logic/services/info_repository.dart';

class FavoriteListScreenModel {
  final _infoRepo = GetIt.instance.get<InfoRepository>();
  final _commandsRepo = GetIt.instance.get<CommandsRepository>();
  final imageCacheManager = GetIt.instance.get<ImageCacheManager>();

  Future<List<Channel>> favoriteChannelList() {
    return _infoRepo.favoriteChannelList();
  }

  changeToChannel(Channel channel) {
    _commandsRepo.changeToChannel(channel);
  }
}
