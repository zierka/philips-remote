import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:wakelock/wakelock.dart';

class GeneralSettingsScreenModel {
  bool keepScreenOn = false;

  PreferenceStore _store = PreferenceStore();

  Future load() async {
    keepScreenOn = await _store.keepScreenOn;
  }

  saveKeepScreenOn(bool keep) {
    _store.setKeepScreenOn(keep);
    keepScreenOn = keep;

    Wakelock.toggle(enable: keep);
  }
}
