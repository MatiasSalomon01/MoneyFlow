import 'package:flutter/material.dart';

class ThemeApp extends ChangeNotifier {
  static late final Color _currentColor;

  set currentColor(Color value) {
    _currentColor = value;
    notifyListeners();
  }

  Color get currentColor => _currentColor;
}
