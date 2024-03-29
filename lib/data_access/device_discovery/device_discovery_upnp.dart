import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:upnp/upnp.dart' as upnp;
import 'device_discovery_mixin.dart';

/// Discovers TV's on the local network.
/// - searches for upnp devices
/// - gets device details
/// - for every device makes a request with all the known api versions
/// - for the ones that responds with 200, detemine port and scheme
class DeviceDiscoveryUpnp with DeviceDiscoveryMixin {
  late upnp.DeviceDiscoverer _discoverer = upnp.DeviceDiscoverer();

  Future<List<TV>> getTVs() async {
    Log.d(">> searching for tvs upnp...");

    final candidates = await _getCandidates();

    Log.d("found candidate: $candidates");

    List<TV> tvs = [];

    for (TVCandidate candidate in candidates) {
      Log.d("get details for candidate ${candidate.ip}");

      final tv = await getDeviceDetails(candidate);

      Log.d("details for candidate ${candidate.ip}: $tv");

      if (tv != null) {
        tvs.add(tv);
      }
    }

    return tvs;
  }

  Future<List<TVCandidate>> _getCandidates() async {
    final devices = await _discoverer.getDevices();

    final candidates = devices.where((e) => e.urlBase != null).map(
      (e) {
        final uri = Uri.parse(e.urlBase!);

        return TVCandidate(
          ip: uri.host,
          name: e.modelName ?? "",
          friendlyName: e.friendlyName ?? "",
        );
      },
    );

    return candidates.toList();
  }
}
