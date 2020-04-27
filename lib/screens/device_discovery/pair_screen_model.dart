import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:philips_remote/data/models/auth/confirm_pair_response.dart';
import 'package:philips_remote/data/models/auth/pair_response.dart';
import 'package:philips_remote/data/models/auth/session.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/main_model.dart';
import 'package:philips_remote/services/device_discovery/device_discovery.dart';
import 'package:philips_remote/services/network_client/endpoint_network_client.dart';
import 'package:philips_remote/services/repositories/tv/auth_repository.dart';

class PairScreenModel extends ChangeNotifier {
  bool _isScanning = false;
  get isScanning => _isScanning;

  MainModel mainModel;

  List<TV> _tvs = [];
  get tvs => _tvs;

  TV _currentlyPairingTV;
  PairResponse _pairResponse;

  DeviceDiscovery _deviceDiscovery = GetIt.instance.get<DeviceDiscovery>();
  AuthRepository _authRepository; // = GetIt.instance.get<AuthRepository>();

  scanTapped() {
    print(">> scanning...");

    _isScanning = true;
    notifyListeners();

    _deviceDiscovery.getTVs().then((tvs) {
      _tvs = tvs;
      _isScanning = false;
      print(tvs);
      notifyListeners();
    });
  }

  Future<void> tvSelected(TV tv) async {
    await _pair(tv);
  }

  Future<void> _pair(TV tv) async {
    print(">> pairing with tv ${tv.ip}");

    _currentlyPairingTV = tv;

    final session = Session(tv: tv);
    final client = EndpointNetworkClient(session);
    _authRepository = AuthRepository(client);

    _pairResponse = await _authRepository.pair(tv);
  }

  Future<void> confirmPair(String pin) async {
    print(">> confirm pairing pin $pin");

    // update auth repo with a networking client that has session (credential) info
    final session =
        Session(tv: _currentlyPairingTV, credential: _pairResponse.credential);
    final client = EndpointNetworkClient(session);
    _authRepository = AuthRepository(client);

    final confirmPair = ConfirmPairRequest(_pairResponse, pin);

    await _authRepository.confirmPair(confirmPair);

    mainModel.setSession(session);
  }
}