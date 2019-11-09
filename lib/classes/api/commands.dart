import 'package:philips_remote/classes/api/remote_client.dart';
import 'package:philips_remote/classes/store/keystore.dart';
import 'package:philips_remote/classes/api/auth.dart';

class Commands {
  static void getVolume() {
    print("#0");

    final url = URLComponents().url + "/audio/volume";
    print("CONFIRM PAIR REQUEST: $url");

    print("#1, uri ${Uri.parse(url)}");

    // RemoteClient.addCredentials(
    // Uri.parse(url), Keystore.instance.user, Keystore.instance.user);

    print("#3");

    final response = RemoteClient.client.get(url);

    print("#4");

    response.then((response) {
      print("response ${response.body}");
    }).catchError((error) {
      print(error);
    });
  }
}
