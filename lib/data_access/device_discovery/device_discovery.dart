import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/data_access/device_discovery/device_discovery_direct_search.dart';
import 'package:phimote/data_access/device_discovery/device_discovery_upnp.dart';

class DeviceDiscovery {
  DeviceDiscovery();

  Future<List<TV>> getTVs() async {
    final upnp = DeviceDiscoveryUpnp();

    var tvs = await upnp.getTVs();

    Log.d(tvs.toString());

    final directSearch = DeviceDiscoveryDirectSearch();

    final tvs2 = await directSearch.getTVs();

    Log.d(tvs2.toString());

    return [...tvs, ...tvs2];
  }
}
