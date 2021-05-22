import 'package:phimote/pigeon.dart';

enum ApiErrorType {
  unknown,
  parsingFailed,
  notFound,
  timeout,
}

class ApiException implements Exception {
  late String error;
  late int code;

  ApiException.error(
    NetworkError error,
  ) {
    this.error = error.error!;
    this.code = error.code!;
  }

  ApiErrorType get type {
    switch (code) {
      case 404:
        return ApiErrorType.notFound;

      case 408:
        return ApiErrorType.timeout;

      default:
        return ApiErrorType.unknown;
    }
  }

  String get message {
    switch (type) {
      case ApiErrorType.unknown:
        return "An error occured";

      case ApiErrorType.parsingFailed:
        return "Parsing failed";

      case ApiErrorType.notFound:
        return "Not found";

      case ApiErrorType.timeout:
        return "Request timed out";
    }
  }
}
