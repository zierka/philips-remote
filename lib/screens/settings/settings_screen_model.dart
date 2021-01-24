import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/screens/root/root_model.dart';

class SettingsScreenModel {
  RootModel rootModel;

  SettingsScreenModel();

  unpair() {
    Log.d("unpair");

    rootModel.clearSession();
  }
}
