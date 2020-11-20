import 'package:phimote/screens/root/root_model.dart';

class SettingsScreenModel {
  RootModel rootModel;

  SettingsScreenModel();

  unpair() {
    print("unpair");

    rootModel.clearSession();
  }
}
