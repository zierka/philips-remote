import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  final jsonStr = await rootBundle.loadString(assetsPath);

  return jsonDecode(jsonStr);
}

class CommandsRaw {
  late Map<String, dynamic> _json;

  CommandsRaw() {
    parseJsonFromAssets("assets/available_commands.json").then((json) {
      _json = json;
    });
  }
}
