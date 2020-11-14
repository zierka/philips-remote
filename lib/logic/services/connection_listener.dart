import 'package:connectivity/connectivity.dart';

class ConnectionListener {
  Stream<bool> connectedStream;

  ConnectionListener() {
    connectedStream = Connectivity()
        .onConnectivityChanged
        .asyncMap(
          (event) => event == ConnectivityResult.wifi,
        )
        .distinct();

    connectedStream.listen((event) {
      print(">> connectivity: $event");
    });
  }
}
