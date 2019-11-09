import 'package:shared_preferences/shared_preferences.dart';

const String _IP = "ip";
const String _USER = "user";
const String _PASS = "pass";

class Keystore {
  static Keystore instance;

  static initialize() async {
    Stopwatch stopwatch = new Stopwatch()..start();

    await SharedPreferences.getInstance().then((prefs) {
      instance = Keystore._internal(prefs);

      print("Keystore.initialize executed in ${stopwatch.elapsed}");
    });
  }

  SharedPreferences _prefs;

  Keystore._internal(SharedPreferences prefs) {
    _prefs = prefs;
  }

  // ip
  get ip => _prefs.getString(_IP);
  set ip(String value) => _prefs.setString(_IP, value);

  // user
  get user => _prefs.getString(_USER);
  set user(String value) => _prefs.setString(_USER, value);

  // pass
  get pass => _prefs.getString(_PASS);
  set pass(String value) => _prefs.setString(_PASS, value);
}
