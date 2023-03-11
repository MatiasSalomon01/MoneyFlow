import 'package:flutter/material.dart';

class AlertProvider extends ChangeNotifier {
  bool onDelete = false;

  changeDelete(bool value) {
    onDelete = value;
    notifyListeners();
  }
}
