import 'dart:convert';

import 'package:phimote/logic/models/auth/session.dart';
import 'package:phimote/data_access/persistence/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static const _keyPrefix = "com.izerik.preference_store.key.";

  static final String session = "session";
  static final String keepScreenOn = _keyPrefix + "keep_screen_on";
}

class PreferenceStore implements Store {
  final _prefs = SharedPreferences.getInstance();

  final _jsonEncoder = JsonEncoder();
  final _jsonDecoder = JsonDecoder();

  // string

  @override
  Future<String> string(String key) async {
    final prefs = await _prefs;

    try {
      final value = prefs.getString(key);
      return Future.value(value);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    prefs.setString(key, value);

    return Future.value();
  }

  // bool

  Future<bool> boolean(String key) async {
    final prefs = await _prefs;

    try {
      final value = prefs.getBool(key);
      return Future.value(value);
    } catch (e) {
      return Future.value(null);
    }
  }

  Future<void> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    prefs.setBool(key, value);

    return Future.value();
  }

  // object

  @override
  Future<Map<String, dynamic>> object(String key) async {
    final value = await string(key);

    if (value != null) {
      final map = _jsonDecoder.convert(value) as Map<String, dynamic>;
      return Future.value(map);
    }

    return null;
  }

  @override
  Future<void> saveObject(String key, Map<String, dynamic> object) async {
    final prefs = await _prefs;

    if (object == null) {
      prefs.setString(key, null);
    } else {
      final value = _jsonEncoder.convert(object);
      prefs.setString(key, value);
    }

    return Future.value();
  }

  // STUFF

  Future<Session> _currentSession() async {
    final o = await object(_Keys.session);

    try {
      final session = Session.fromJson(o);
      return session;
    } catch (e) {
      return null;
    }
  }

  // current session
  get session => _currentSession();
  // TODO: Improve this
  set session(Session session) =>
      saveObject(_Keys.session, session?.toJson() ?? null);

  Future<bool> get keepScreenOn => boolean(_Keys.keepScreenOn)
      .then((value) => Future.value(value != null ? value : true));

  setKeepScreenOn(bool keep) => saveBool(_Keys.keepScreenOn, keep);
}
