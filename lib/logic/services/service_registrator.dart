import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/data_access/device_discovery/device_discovery.dart';
import 'package:phimote/logic/services/image_cache_manager.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/logic/services/commands_repository.dart';
import 'package:phimote/logic/services/info_repository.dart';

class ServiceRegistrator {
  static registerGeneralServices() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<DeviceDiscovery>(
      () => DeviceDiscovery(),
    );
  }

  static registerSessionServices(Session session) {
    if (session == null) return;

    final getIt = GetIt.instance;

    final endpointNetworkClient = EndpointNetworkClient(session);

    getIt.registerLazySingleton<CommandsRepository>(
      () => CommandsRepository(endpointNetworkClient),
    );

    getIt.registerLazySingleton<InfoRepository>(
      () => InfoRepository(endpointNetworkClient),
    );

    getIt.registerLazySingleton<ImageCacheManager>(
      () => ImageCacheManager(endpointNetworkClient),
    );
  }

  static unregisterSessionServices() {
    final getIt = GetIt.instance;

    if (getIt.isRegistered<CommandsRepository>()) {
      getIt.unregister<CommandsRepository>();
    }

    if (getIt.isRegistered<InfoRepository>()) {
      getIt.unregister<InfoRepository>();
    }

    if (getIt.isRegistered<ImageCacheManager>()) {
      getIt.unregister<ImageCacheManager>();
    }
  }
}
