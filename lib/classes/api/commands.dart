import 'package:philips_remote/classes/network/remote_client.dart';
import 'package:philips_remote/classes/api/auth.dart';
import 'dart:convert' as convert;

import 'api.dart';

class Commands {
  static void getVolume() {
    print("#0");

    final url = API.baseUrl + "audio/volume";
    print("CONFIRM PAIR REQUEST: $url");

    print("#1, uri ${Uri.parse(url)}");

    print("#3");

    final response = RemoteClient.client.get(url);

    print("#4");

    response.then((response) {
      print("response ${response.body}");
    }).catchError((error) {
      print(error);
    });
  }

  static void postKeyStandby() {
    final url = API.baseUrl + "input/key";

    Map<String, String> json = {
      "key": "Standby",
    };

    final body = convert.json.encode(json);

    final response = RemoteClient.client.post(url, body: body);
  }
}
