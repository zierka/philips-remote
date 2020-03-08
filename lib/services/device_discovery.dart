import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:philips_remote/data/models/system.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/network_client/network_client.dart';

import 'package:upnp/upnp.dart' as upnp;

// legacy discovery

import 'dart:async';
import 'dart:io';
import 'package:ping_discover_network/ping_discover_network.dart';

const _apiVersions = [6, 5, 2];

class _Configuration {
  final String scheme;
  final int port;

  const _Configuration({this.scheme, this.port});
}

const nonAndroidConfiguration = _Configuration(scheme: "http", port: 1925);
const androidConfiguration = _Configuration(scheme: "https", port: 1926);

/// Discovers TV's on the local network.
/// - searches for upnp devices
/// - gets device details
/// - for every device makes a request with all the known api versions
/// - for the ones that responds with 200, detemine port and scheme
class DeviceDiscovery {
  upnp.DeviceDiscoverer _discoverer;

  DeviceDiscovery() {
    _discoverer = upnp.DeviceDiscoverer();
  }

  Future<List<TV>> getTVs() async {
    final candidates = await _getCandidates();

    List<TV> tvs = [];

    for (TVCandidate candidate in candidates) {
      final tv = await _getDeviceDetails(candidate);
      if (tv != null) {
        tvs.add(tv);
      }
    }

    return tvs;
  }

  Future<List<TVCandidate>> _getCandidates() async {
    final devices = await _discoverer.getDevices();

    final candidates = devices.map((e) {
      final uri = Uri.parse(e.urlBase);

      return TVCandidate(
        ip: uri.host,
        name: e.modelName,
        friendlyName: e.friendlyName,
      );
    });

    return candidates.toList();
  }

  Future<TV> _getDeviceDetails(TVCandidate candidate) async {
    for (int apiVersion in _apiVersions) {
      final tv = TV(
          candidate: candidate,
          protocol: nonAndroidConfiguration.scheme,
          port: nonAndroidConfiguration.port,
          apiVersion: apiVersion);

      final url = tv.baseUrl + "system";

      Response response;

      try {
        response = await NetworkClient.get(url);
      } catch (e) {
        continue;
      }

      final responseJson = convert.json.decode(response.body);
      final system = System.fromJson(responseJson);

      final apiVersion1 = system.apiVersion.major;

      if (system.featuring.systemFeatures.pairingType ==
          "digest_auth_pairing") {
        return TV(
          candidate: candidate,
          protocol: androidConfiguration.scheme,
          port: androidConfiguration.port,
          apiVersion: apiVersion1,
        );
      } else {
        return TV(
          candidate: candidate,
          protocol: nonAndroidConfiguration.scheme,
          port: nonAndroidConfiguration.port,
          apiVersion: apiVersion1,
        );
      }
    }

    return null;
  }
}

// OLD DISCOVERY

class LegacyDeviceDiscovery {
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

    final int port = nonAndroidConfiguration.port;

    final ips = await _ips(port);
    await Future.delayed(Duration(milliseconds: 1000));

    final _candidates =
        ips.map((e) => TVCandidate2(ip: e, port: port)).toList();

    candidates.addAll(_candidates);

    return candidates;
  }

  Future<TV> _getDeviceDetails(TVCandidate2 candidate) async {
    for (int apiVersion in _apiVersions) {
      final _candidate = TVCandidate(ip: candidate.ip);

      final tv = TV(
          candidate: _candidate,
          protocol: nonAndroidConfiguration.scheme,
          port: nonAndroidConfiguration.port,
          apiVersion: apiVersion);

      final url = tv.baseUrl + "system";

      Response response;

      try {
        response = await NetworkClient.get(url);
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
          candidate: _candidate,
          protocol: androidConfiguration.scheme,
          port: androidConfiguration.port,
          apiVersion: apiVersion1,
        );
      } else {
        return TV(
          candidate: _candidate,
          protocol: nonAndroidConfiguration.scheme,
          port: nonAndroidConfiguration.port,
          apiVersion: apiVersion1,
        );
      }
    }

    return null;
  }
}
