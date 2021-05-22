import 'package:flutter/foundation.dart';
import 'package:phimote/logic/services/logging/log.dart';
import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/auth/confirm_pair_response.dart';
import 'package:phimote/logic/models/auth/pair_response.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/screens/root/root_model.dart';
import 'package:phimote/screens/device_discovery/scan_state.dart';
import 'package:phimote/data_access/device_discovery/device_discovery.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/logic/services/auth_repository.dart';

class PairScreenModel extends ChangeNotifier {
  ScanState state = ScanState.loading();

  RootModel? rootModel;

  TV? _currentlyPairingTV;
  PairResponse? _pairResponse;

  DeviceDiscovery get _deviceDiscovery => GetIt.instance.get<DeviceDiscovery>();

  scanTapped() async {
    Log.d(">> scanning...");

    state = ScanState.loading();
    notifyListeners();

    final tvs = await _deviceDiscovery.getTVs();

    state = ScanState.tvs(tvs);

    notifyListeners();
  }

  Future<void> tvSelected(TV tv) async {
    if (tv.needsAuth) {
      await _pair(tv);
    } else {
      _saveSession(tv);
    }
  }

  Future<void> _pair(TV tv) async {
    Log.d(">> pairing with tv ${tv.ip}");

    _currentlyPairingTV = tv;

    final session = Session(tv: tv);
    final client = EndpointNetworkClient(session);
    final authRepository = AuthRepository(client);

    try {
      _pairResponse = await authRepository.pair(tv);
    } on ConcurrentPairApiException catch (_) {
      // do nothing
    } catch (e) {
      // handle it
    }
  }

  Future<void> confirmPair(String pin) async {
    Log.d(">> confirm pairing pin $pin");

    // update auth repo with a networking client that has session (credential) info
    final session = Session(
      tv: _currentlyPairingTV!,
      credential: _pairResponse!.credential,
    );
    final client = EndpointNetworkClient(session);
    final authRepository = AuthRepository(client);

    final confirmPair = ConfirmPairRequest(_pairResponse!, pin);

    await authRepository.confirmPair(confirmPair);

    rootModel?.setSession(session);
  }

  _saveSession(TV tv) {
    final session = Session(tv: tv);

    rootModel?.setSession(session);
  }
}
