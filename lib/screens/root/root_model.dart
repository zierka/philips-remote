import 'package:flutter/material.dart';
import 'package:philips_remote/logic/models/tv.dart';

class RootModel extends ChangeNotifier {
  TV currentTV() {
    return null;
  }

  signOut() {
    notifyListeners();
  }
}
