import 'package:connectivity/connectivity.dart';

/// whether connected with wifi or not
class WifiConnectionListener {
  static final _connectivity = Connectivity();

  Stream<bool> connectedStream;

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();

    return result == ConnectivityResult.wifi;
  }

  WifiConnectionListener() {
    connectedStream = _connectivity.onConnectivityChanged
        .asyncMap(
          (event) => event == ConnectivityResult.wifi,
        )
        .distinct();
  }
}
