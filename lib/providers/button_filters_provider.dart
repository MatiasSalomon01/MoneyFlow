import 'package:flutter/material.dart';

class ButtonFiltersProvider extends ChangeNotifier {
  bool isPressed = true;

  changeIsPressed() {
    isPressed = !isPressed;
    notifyListeners();
  }
}
