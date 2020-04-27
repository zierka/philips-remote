import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/device_discovery/device_discovery_direct_search.dart';
import 'package:philips_remote/services/device_discovery/device_discovery_upnp.dart';
import 'package:philips_remote/services/network_client/network_client.dart';

class DeviceDiscovery {
  NetworkClient _client;

  DeviceDiscovery(this._client);

  Future<List<TV>> getTVs() async {
    final DeviceDiscoveryUpnp _upnp = DeviceDiscoveryUpnp(_client);

    final tvs = await _upnp.getTVs();

    if (tvs.isNotEmpty) {
      return tvs;
    }

    DeviceDiscoveryDirectSearch _directSearch =
        DeviceDiscoveryDirectSearch(_client);

    final tvs2 = await _directSearch.getTVs();

    return tvs2;
  }
}