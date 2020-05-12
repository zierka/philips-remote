import 'dart:convert';

import 'package:philips_remote/data/models/auth/session.dart';
import 'package:philips_remote/services/persistence/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _SESSION = "session";

class PreferenceStore implements Store {
  final _prefs = SharedPreferences.getInstance();

  final _jsonEncoder = JsonEncoder();
  final _jsonDecoder = JsonDecoder();

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
    final o = await object(_SESSION);

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
      saveObject(_SESSION, session?.toJson() ?? null);
}
