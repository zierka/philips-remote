import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/logic/models/system.dart';
import 'package:phimote/pigeon.dart';
import 'package:phimote/util/extensions/response.dart';

class SystemRepository {
  EndpointNetworkClient _client;

  SystemRepository(EndpointNetworkClient client) {
    _client = client;
  }

  /// "system"
  Future<System> system({int timeout}) async {
    final endpoint = "system";

    final options = RequestOptions();
    options.timeout = timeout;

    final response = await _client.get(endpoint, options: options);
    final system = System.fromJson(response.toJson());

    return system;
  }

  /// this ain't working, no idea how it should be used
  Future<void> notifyChange() async {
    final endpoint = "notifychange";

    final options = RequestOptions();
    options.port = 1925;

    final response = await _client.post(endpoint, options: options);
    Log.d(response.toString());
    // final system = System.fromJson(response.toJson());

    // return system;
  }
}
