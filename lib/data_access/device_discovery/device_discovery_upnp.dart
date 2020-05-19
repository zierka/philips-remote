import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:philips_remote/logic/models/device_discovery/discovery_configuration.dart';
import 'package:philips_remote/logic/models/system.dart';
import 'package:philips_remote/logic/models/tv.dart';
import 'package:philips_remote/data_access/network_client/network_client.dart';

import 'package:upnp/upnp.dart' as upnp;

/// Discovers TV's on the local network.
/// - searches for upnp devices
/// - gets device details
/// - for every device makes a request with all the known api versions
/// - for the ones that responds with 200, detemine port and scheme
class DeviceDiscoveryUpnp {
  upnp.DeviceDiscoverer _discoverer;
  NetworkClient _client;

  DeviceDiscoveryUpnp(NetworkClient client) {
    _discoverer = upnp.DeviceDiscoverer();
    _client = client;
  }

  Future<List<TV>> getTVs() async {
    print(">> searching for tvs upnp...");

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
    for (int apiVersion in DiscoveryConfiguration.apiVersions) {
      final tv = TV(
        protocol: DiscoveryConfiguration.nonAndroid.scheme,
        ip: candidate.ip,
        port: DiscoveryConfiguration.nonAndroid.port,
        apiVersion: apiVersion,
        name: candidate.name,
        friendlyName: candidate.friendlyName,
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
