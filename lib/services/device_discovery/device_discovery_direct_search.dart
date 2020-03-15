import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:philips_remote/data/models/device_discovery/discovery_configuration.dart';
import 'package:philips_remote/data/models/system.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/network_client/network_client.dart';
import 'package:ping_discover_network/ping_discover_network.dart';

/// Alternative discovery method
class DeviceDiscoveryDirectSearch {
  NetworkClient _client;

  DeviceDiscoveryDirectSearch(this._client);

  Future<List<TV>> getTVs() async {
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
    for (int apiVersion in DiscoveryConfiguration.apiVersions) {
      final _candidate = TVCandidate(ip: candidate.ip);

      final tv = TV(
        protocol: DiscoveryConfiguration.nonAndroid.scheme,
        ip: _candidate.ip,
        port: DiscoveryConfiguration.nonAndroid.port,
        apiVersion: apiVersion,
        name: _candidate.name,
        friendlyName: _candidate.friendlyName,
      );

      final url = tv.baseUrl + "system";

      Response response;

      try {
        response = await _client.get(url);
      } catch (e) {
        continue;
      }

      final responseJson = convert.json.decode(response.body);
      final system = System.fromJson(responseJson);

      final apiVersion1 = system.apiVersion.major;
      final name = responseJson["name"];

      _candidate.friendlyName = name;
      _candidate.name = "";

      if (system.featuring.systemFeatures.pairingType ==
          "digest_auth_pairing") {
        return TV(
          protocol: DiscoveryConfiguration.android.scheme,
          ip: tv.ip,
          port: DiscoveryConfiguration.android.port,
          apiVersion: apiVersion1,
          name: tv.name,
          friendlyName: tv.friendlyName,
        );
      } else {
        return TV(
          protocol: DiscoveryConfiguration.nonAndroid.scheme,
          ip: tv.ip,
          port: DiscoveryConfiguration.nonAndroid.port,
          apiVersion: apiVersion1,
          name: tv.name,
          friendlyName: tv.friendlyName,
        );
      }
    }

    return null;
  }
}
