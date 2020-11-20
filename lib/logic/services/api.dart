import 'package:phimote/pigeon.dart';

enum ApiErrorType {
  unknown,
  parsingFailed,
  notFound,
  timeout,
}

class ApiException implements Exception {
  String error;
  int code;

  // ignore: missing_return
  ApiErrorType get type {
    switch (code) {
      case 404:
        return ApiErrorType.notFound;
        break;
      case 408:
        return ApiErrorType.timeout;
        break;
      default:
        return ApiErrorType.unknown;
        break;
    }
  }

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

  ApiException.error(
    NetworkError error,
  ) {
    this.error = error.error;
    this.code = error.code;
  }
}
