import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:philips_remote/classes/api/commands.dart';

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

class CommandsRaw {
  Map<String, dynamic> _json;

  CommandsRaw() {
    parseJsonFromAssets("assets/available_commands.json").then((json) {
      _json = json;
    });
  }
}
