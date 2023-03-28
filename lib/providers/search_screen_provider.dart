import 'package:flutter/material.dart';

class SearchScreenProvider extends ChangeNotifier {
  late dynamic _input = "";

  late int _menuItemOption = 1;

  late DateTime _dateChoosed = DateTime.now();

  // String _inputText = "";

  dynamic get input => _input;

  set input(dynamic value) {
    _input = value;
    notifyListeners();
  }

  int get menuItemOption => _menuItemOption;

  set menuItemOption(int value) {
    _menuItemOption = value;
    notifyListeners();
  }

  DateTime get dateChoosed => _dateChoosed;

  set dateChoosed(DateTime value) {
    _dateChoosed = value;
    notifyListeners();
  }

//   String get inputText => _inputText;

//   set inputText(String value) {
//     _inputText = value;
//     notifyListeners();
//   }
}
