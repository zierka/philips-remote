import 'package:phimote/data_access/network_client/network_client.dart';
import 'package:phimote/logic/models/system.dart';
import 'package:phimote/util/extensions/response.dart';

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
