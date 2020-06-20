import 'package:philips_remote/data_access/network_client/network_client.dart';
import 'package:philips_remote/logic/models/system.dart';
import 'package:philips_remote/util/extensions/response.dart';

class SystemRepository {
  NetworkClient _client;

  SystemRepository(NetworkClient client) {
    _client = client;
  }

  /// "system"
  Future<System> system() async {
    final endpoint = "system";
    final response = await _client.get(endpoint);
    final system = System.fromJson(response.toJson());

    return system;
  }
}
