import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/auth/confirm_pair_response.dart';
import 'package:phimote/logic/models/auth/pair_response.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/main/main_model.dart';
import 'package:phimote/screens/device_discovery/scan_state.dart';
import 'package:phimote/data_access/device_discovery/device_discovery.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/logic/services/auth_repository.dart';

class PairScreenModel extends ChangeNotifier {
  ScanState state = ScanState.loading();

  MainModel mainModel;

  TV _currentlyPairingTV;
  PairResponse _pairResponse;

  DeviceDiscovery _deviceDiscovery = GetIt.instance.get<DeviceDiscovery>();
  AuthRepository _authRepository;

  scanTapped() {
    print(">> scanning...");

    state = ScanState.loading();
    notifyListeners();

    _deviceDiscovery.getTVs().then((tvs) {
      state = ScanState.tvs(tvs);
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
