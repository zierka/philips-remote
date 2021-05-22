import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/logic/models/auth/confirm_pair_response.dart';
import 'package:phimote/logic/models/auth/pair_request.dart';
import 'package:phimote/logic/models/auth/pair_response.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'package:phimote/util/extensions/response.dart';

class ConcurrentPairApiException implements Exception {}

class AuthRepository {
  EndpointNetworkClient _client;

  AuthRepository(this._client);

  /// POST `https://192.168.1.4:1926/6/pair/request`
  Future<PairResponse> pair(TV tv) async {
    final request = PairRequest(tv: tv);

    final endpoint = "pair/request";

    final response = await _client.post(endpoint, json: request.data);
    final responseJson = response.toJson();

    if (responseJson["error_id"] == "SUCCESS") {
      Log.d("success");

      final response = PairResponse.fromJson(responseJson);

      response.request = request;

      return response;
    } else if (responseJson["error_id"] == "CONCURRENT_PAIRING") {
      throw ConcurrentPairApiException();
    } else {
      Log.d("error $responseJson");

      throw ("/pair/request returned failure");
    }
  }

  /// POST `https://192.168.1.4:1926/6/pair/grant`
  Future<void> confirmPair(ConfirmPairRequest request) async {
    final endpoint = "pair/grant";

    await _client.post(endpoint, json: request.data);
  }
}
