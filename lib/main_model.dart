import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:philips_remote/data/models/auth/session.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/image_cache_manager.dart';
import 'package:philips_remote/services/network_client/endpoint_network_client.dart';
import 'package:philips_remote/services/persistence/preference_store.dart';
import 'package:philips_remote/services/repositories/tv/commands_repository.dart';
import 'package:philips_remote/services/repositories/tv/info_repository.dart';

class MainModel extends ChangeNotifier {
  TV tv;
  bool isLoading = false;

  static Future<MainModel> load() async {
    final store = PreferenceStore();
    final session = await store.currentSession();

    _registerServices(session);

    final mainModel = MainModel(session);

    return Future.delayed(Duration(seconds: 2), () => mainModel);
  }

  MainModel(Session session) {
    tv = session.tv;
  }

  MainModel.isLoading() {
    isLoading = true;
  }

  static _registerServices(Session session) {
    final getIt = GetIt.instance;

    final client = EndpointNetworkClient(session);

    getIt.registerLazySingleton<CommandsRepository>(
      () => CommandsRepository(client),
    );

    getIt.registerLazySingleton<InfoRepository>(
      () => InfoRepository(client),
    );

    getIt.registerLazySingleton<ImageCacheManager>(
      () => ImageCacheManager(client),
    );
  }
}
