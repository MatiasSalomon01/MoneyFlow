import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  late dynamic _input;

  dynamic get input => _input;

  set input(dynamic value) {
    _input = value;
    notifyListeners();
  }
}
