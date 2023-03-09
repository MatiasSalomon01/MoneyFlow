import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';

class ModelOptionsProvider extends ChangeNotifier {
  double height = 0;

  double changeHeight(double value) {
    height = value;
    notifyListeners();
    return height;
  }
}
