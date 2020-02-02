import 'dart:async';
import 'dart:io';

import 'package:philips_remote/classes/api/api.dart';
import 'package:ping_discover_network/ping_discover_network.dart';

class Scanner {
  static Future<List<String>> scan() async {
    print("scanning...");

    String localIP;

    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');

        if (addr.type == InternetAddressType.IPv4) {
          localIP = addr.address;
        }
      }
    }

    print("local ip: $localIP");

    final String subnet = localIP.substring(0, localIP.lastIndexOf('.'));

    List<String> devices = [];

    final completer = Completer<List<String>>();

    final stream = NetworkAnalyzer.discover2(subnet, API.port);
    stream.listen((NetworkAddress addr) {
      if (addr.exists) {
        print('Found device: ${addr.ip}, ');
        devices.add(addr.ip);
      }
    }, onDone: () {
      print("onDone");
      completer.complete(devices);
    });

    return completer.future;
  }
}
