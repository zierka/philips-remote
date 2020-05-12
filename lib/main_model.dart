import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:philips_remote/data/models/auth/session.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/device_discovery/device_discovery.dart';
import 'package:philips_remote/services/image_cache_manager.dart';
import 'package:philips_remote/services/network_client/endpoint_network_client.dart';
import 'package:philips_remote/services/network_client/network_client.dart';
import 'package:philips_remote/services/persistence/preference_store.dart';
import 'package:philips_remote/services/repositories/tv/commands_repository.dart';
import 'package:philips_remote/services/repositories/tv/info_repository.dart';

class MainModel extends ChangeNotifier {
  TV tv;
  bool isLoading = false;

  MainModel() {
    isLoading = true;

    _registerGeneralServices();

    _loadSession();
  }

  Future<void> _loadSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    isLoading = false;

    if (session != null) {
      print(">> loaded session from local store. tv ip ${session.tv.ip}");

      tv = session.tv;

      _registerSessionServices(session);
    } else {
      print(">> no session found");
    }

    // show loading indicator for 1 sec

    await Future.delayed(Duration(seconds: 1), () => null);

    notifyListeners();

    return Future.value(null);
  }

  setSession(Session session) {
    print(">> setting session. tv ip ${session.tv.ip}");

    tv = session.tv;

    final store = PreferenceStore();
    store.session = session;

    _unregisterSessionServices();
    _registerSessionServices(session);

    notifyListeners();
  }

  clearSession() async {
    print(">> clear session");

    tv = null;

    final store = PreferenceStore();
    store.session = null;

    _unregisterSessionServices();

    // show loading indicator for 1 sec

    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1), () => null);

    isLoading = false;
    notifyListeners();
  }

  _registerGeneralServices() {
    final getIt = GetIt.instance;

    final networkClient = NetworkClient();

    getIt.registerLazySingleton<DeviceDiscovery>(
      () => DeviceDiscovery(networkClient),
    );
  }

  _registerSessionServices(Session session) {
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

  _unregisterSessionServices() {
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
