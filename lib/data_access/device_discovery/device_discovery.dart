import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/data_access/device_discovery/device_discovery_direct_search.dart';
import 'package:phimote/data_access/device_discovery/device_discovery_upnp.dart';

class DeviceDiscovery {
  DeviceDiscovery();

  Future<List<TV>> getTVs() async {
    final upnp = DeviceDiscoveryUpnp();

    final tvs = await upnp.getTVs();

    if (tvs.isNotEmpty) {
      return tvs;
    }

    final directSearch = DeviceDiscoveryDirectSearch();

    final tvs2 = await directSearch.getTVs();

    return tvs2;
  }
}
