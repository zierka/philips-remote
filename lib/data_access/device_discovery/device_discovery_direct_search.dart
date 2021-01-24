import 'dart:async';
import 'dart:io';
import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/logic/models/device_discovery/discovery_configuration.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:ping_discover_network/ping_discover_network.dart';

import 'device_discovery_mixin.dart';

/// Alternative discovery method
class DeviceDiscoveryDirectSearch with DeviceDiscoveryMixin {
  DeviceDiscoveryDirectSearch();

  Future<List<TV>> getTVs() async {
    Log.d(">> searching for tvs with direct search...");

    final candidates = await _getCandidates();

    List<TV> tvs = [];

    for (TVCandidate2 candidate in candidates) {
      final tv = await _getDeviceDetails(candidate);
      if (tv != null) {
        tvs.add(tv);
      }
    }

    return tvs;
  }

  // returns the ip addresses that respond to ping on the specified port
  Future<List<String>> _ips(int port) async {
    String localIP;

    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          localIP = addr.address;
        }
      }
    }

    final String subnet = localIP.substring(0, localIP.lastIndexOf('.'));

    List<String> ips = [];

    final completer = Completer<List<String>>();

    final stream = NetworkAnalyzer.discover2(subnet, port);
    stream.listen((NetworkAddress addr) {
      if (addr.exists) {
        ips.add(addr.ip);
      }
    }, onDone: () {
      completer.complete(ips);
    });

    return completer.future;
  }

  Future<List<TVCandidate2>> _getCandidates() async {
    List<TVCandidate2> candidates = [];

    final int port = DiscoveryConfiguration.nonAndroid.port;

    final ips = await _ips(port);
    await Future.delayed(Duration(milliseconds: 1000));

    final _candidates =
        ips.map((e) => TVCandidate2(ip: e, port: port)).toList();

    candidates.addAll(_candidates);

    return candidates;
  }

  Future<TV> _getDeviceDetails(TVCandidate2 candidate) async {
    final _candidate = TVCandidate(ip: candidate.ip);

    return getDeviceDetails(_candidate);
  }
}
