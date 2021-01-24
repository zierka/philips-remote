import 'package:phimote/pigeon.dart';

extension NetworkErrorExt on NetworkError {
  String toString2() => 'NetworkError(error: $error, code: $code)';
}
