import 'package:philips_remote/main/main_model.dart';

class SettingsScreenModel {
  MainModel mainModel;

  SettingsScreenModel();

  unpair() {
    print("unpair");

    mainModel.clearSession();
  }
}
