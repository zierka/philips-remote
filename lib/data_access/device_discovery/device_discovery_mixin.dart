import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/logic/models/device_discovery/discovery_configuration.dart';
import 'package:phimote/logic/models/system.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/logic/services/system_repository.dart';

mixin DeviceDiscoveryMixin {
  Future<TV?> getDeviceDetails(TVCandidate candidate) async {
    for (int apiVersion in DiscoveryConfiguration.apiVersions) {
      final tv = TV(
        protocol: DiscoveryConfiguration.nonAndroid.scheme,
        ip: candidate.ip,
        port: DiscoveryConfiguration.nonAndroid.port,
        apiVersion: apiVersion,
        name: candidate.name,
        friendlyName: candidate.friendlyName,
      );

      final session = Session(tv: tv);
      final client = EndpointNetworkClient(session);
      final systemRepo = SystemRepository(client);

      System system;

      try {
        system = await systemRepo.system();
      } catch (e) {
        continue;
      }

      final apiVersion1 = system.apiVersion.major;

      if (system.featuring.systemFeatures.pairingType ==
          "digest_auth_pairing") {
        return TV(
          protocol: DiscoveryConfiguration.android.scheme,
          ip: tv.ip,
          port: DiscoveryConfiguration.android.port,
          apiVersion: apiVersion1,
          name: tv.name,
          friendlyName: tv.friendlyName ?? system.name,
        );
      } else {
        return TV(
          protocol: DiscoveryConfiguration.nonAndroid.scheme,
          ip: tv.ip,
          port: DiscoveryConfiguration.nonAndroid.port,
          apiVersion: apiVersion1,
          name: tv.name,
          friendlyName: tv.friendlyName ?? system.name,
        );
      }
    }

    return null;
  }
}
