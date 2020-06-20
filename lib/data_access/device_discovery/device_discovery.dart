import 'package:philips_remote/logic/models/tv.dart';
import 'package:philips_remote/data_access/device_discovery/device_discovery_direct_search.dart';
import 'package:philips_remote/data_access/device_discovery/device_discovery_upnp.dart';
import 'package:philips_remote/data_access/network_client/network_client.dart';

class DeviceDiscovery {
  NetworkClient _client;

  DeviceDiscovery(this._client);

  Future<List<TV>> getTVs() async {
    final upnp = DeviceDiscoveryUpnp(_client);

    final tvs = await upnp.getTVs();

    if (tvs.isNotEmpty) {
      return tvs;
    }

    final directSearch = DeviceDiscoveryDirectSearch(_client);

    final tvs2 = await directSearch.getTVs();

    return tvs2;
  }
}
