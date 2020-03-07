import 'package:http/http.dart';
import 'dart:convert' as convert;

extension Parsing on Response {
  /// Converts the response body to JSON with UTF8 decoding
  dynamic toJson() {
    return convert.json.decode(convert.utf8.decode(bodyBytes));
  }
}
