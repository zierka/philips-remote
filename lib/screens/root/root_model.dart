import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/tv.dart';

class RootModel extends ChangeNotifier {
  TV currentTV() {
    return null;
  }

  signOut() {
    notifyListeners();
  }
}
