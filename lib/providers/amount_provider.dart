import 'package:flutter/material.dart';

class AmountProvider extends ChangeNotifier {
  bool iconState = false;

  changeIconState() {
    iconState = !iconState;
    notifyListeners();
  }
}
