import 'package:get_it/get_it.dart';
import 'package:philips_remote/data/models/application.dart';
import 'package:philips_remote/services/image_cache_manager.dart';
import 'package:philips_remote/services/repositories/tv/commands_repository.dart';
import 'package:philips_remote/services/repositories/tv/info_repository.dart';

class AppListModel {
  final _infoRepo = GetIt.instance.get<InfoRepository>();
  final _commandsRepo = GetIt.instance.get<CommandsRepository>();
  final imageCacheManager = GetIt.instance.get<ImageCacheManager>();

  Future<List<Application>> applications() {
    return _infoRepo.applicationList();
  }

  openApplication(Application app) {
    _commandsRepo.openApplication(app);
  }
}
