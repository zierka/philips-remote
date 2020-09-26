import 'package:flutter/material.dart';
import 'package:phimote/logic/models/tv.dart';

class RootModel extends ChangeNotifier {
  TV currentTV() {
    return null;
  }

  signOut() {
    notifyListeners();
  }
}
