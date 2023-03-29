import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';

class SearchScreenProvider extends ChangeNotifier {
  late dynamic _input = "";

  late int _menuItemOption = 1;

  late DateTime _dateChoosed = DateTime.now();

  late List<CardInfo> _cards = [];

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

  List<CardInfo> get cards => _cards;

  set cards(List<CardInfo> value) {
    _cards = value;
    notifyListeners();
  }
}
