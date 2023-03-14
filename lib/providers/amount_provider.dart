import 'package:flutter/material.dart';

class AmountProvider extends ChangeNotifier {
  bool iconState = true;

  changeIconState() {
    iconState = !iconState;
    notifyListeners();
  }
}
