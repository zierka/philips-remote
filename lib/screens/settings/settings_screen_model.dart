import 'package:flutter/foundation.dart';
import 'package:phimote/screens/root/root_model.dart';

class SettingsScreenModel {
  RootModel rootModel;

  SettingsScreenModel();

  unpair() {
    debugPrint("unpair");

    rootModel.clearSession();
  }
}
