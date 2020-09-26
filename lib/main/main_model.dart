import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/main/main_model_state.dart';
import 'package:phimote/data_access/device_discovery/device_discovery.dart';
import 'package:phimote/logic/services/image_cache_manager.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/data_access/network_client/network_client.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/logic/services/commands_repository.dart';
import 'package:phimote/logic/services/info_repository.dart';

class MainModel extends ChangeNotifier {
  MainModelState state;

  MainModel() {
    state = MainModelState.loading();

    _registerGeneralServices();

    _loadSession();
  }

  Future<void> _loadSession() async {
    final store = PreferenceStore();
    final session = await store.session;

    if (session != null && session.tv != null) {
      print(">> loaded session from local store. tv ip ${session.tv.ip}");

      state = MainModelState.content(session.tv);

      _registerSessionServices(session);
    } else {
      print(">> no session found");

      state = MainModelState.landing();
    }

    // show loading indicator for 1 sec

    await Future.delayed(Duration(seconds: 1), () => null);

    notifyListeners();

    return Future.value(null);
  }

  setSession(Session session) {
    print(">> setting session. tv ip ${session.tv.ip}");

    state = MainModelState.content(session.tv);

    final store = PreferenceStore();
    store.session = session;

    _unregisterSessionServices();
    _registerSessionServices(session);

    notifyListeners();
  }

  clearSession() async {
    print(">> clear session");

    final store = PreferenceStore();
    store.session = null;

    _unregisterSessionServices();

    // show loading indicator for 1 sec

    state = MainModelState.loading();
    notifyListeners();

    await Future.delayed(Duration(seconds: 1), () => null);

    state = MainModelState.landing();
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
