import 'package:phimote/logic/services/connection_listener.dart';

class ContentScreenModel {
  Stream<bool> get connectionStream => ConnectionListener().connectedStream;
}
