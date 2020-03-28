import 'package:philips_remote/data/models/auth/confirm_pair_response.dart';
import 'package:philips_remote/data/models/auth/pair_request.dart';
import 'package:philips_remote/data/models/auth/pair_response.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/network_client/endpoint_network_client.dart';
import 'package:philips_remote/util/convenience.dart';

class AuthRepository {
  EndpointNetworkClient _client;

  AuthRepository(this._client);

  /// POST `https://192.168.1.4:1926/6/pair/request`
  Future<PairResponse> pair(TV tv) async {
    final request = PairRequest(tv: tv);

    final endpoint = "pair/request";

    final response = await _client.post(endpoint, request.data);
    final responseJson = response.toJson();

    if (responseJson["error_id"] == "SUCCESS") {
      print("success");

      final response = PairResponse.fromJson(responseJson);

      response.request = request;

      return response;
    } else {
      print("error");

      throw ("");
    }
  }

  /// POST `https://192.168.1.4:1926/6/pair/grant`
  Future<void> confirmPair(ConfirmPairRequest request) async {
    final endpoint = "pair/grant";

    await _client.post(endpoint, request.data);
  }
}
