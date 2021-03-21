import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:wakelock/wakelock.dart';

class GeneralSettingsScreenModel {
  bool keepScreenOn = false;
  bool shakeToFeedback = false;

  PreferenceStore _store = PreferenceStore();

  Future load() async {
    keepScreenOn = await _store.keepScreenOn;
    shakeToFeedback = await _store.shakeToFeedback;
  }

  saveKeepScreenOn(bool keep) {
    _store.setKeepScreenOn(keep);
    keepScreenOn = keep;

    Wakelock.toggle(enable: keep);
  }

  saveShakeToFeedback(bool enabled) {
    _store.setShakeToFeedback(enabled);
    shakeToFeedback = enabled;
  }
}
