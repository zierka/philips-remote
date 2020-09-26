import 'package:flutter/foundation.dart';

enum ApiErrorType {
  unknown,
  parsingFailed,
  notFound,
  timeout,
}

class ApiException implements Exception {
  ApiErrorType type;

  // ignore: missing_return
  String get message {
    switch (type) {
      case ApiErrorType.unknown:
        return "An error occured";
        break;
      case ApiErrorType.parsingFailed:
        return "Parsing failed";
        break;
      case ApiErrorType.notFound:
        return "Not found";
        break;
      case ApiErrorType.timeout:
        return "Request timed out";
        break;
    }
  }

  ApiException({
    @required this.type,
  });

  ApiException.statusCode({
    @required int statusCode,
  }) {
    switch (statusCode) {
      case 404:
        type = ApiErrorType.notFound;
        break;
      case 408:
        type = ApiErrorType.timeout;
        break;
      default:
        type = ApiErrorType.unknown;
        break;
    }
  }
}
