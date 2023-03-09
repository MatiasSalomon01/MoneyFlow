import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_flow/services/services.dart';

class ModelOptionsProvider extends ChangeNotifier {
  double height = 0;
  String idCard = '';
  CardService cardService = CardService();

  double openModalOptions(double value, String id) {
    height = value;
    idCard = id;
    notifyListeners();
    return height;
  }

  double closeModalOptions(double value) {
    height = value;
    notifyListeners();
    return height;
  }

  void deleteCard(String id) {
    print('Card Selecionado : $id');
    var x = cardService.deleteCard(id);
    print(x);
  }

  void updateCard() {}

  void addCard() {}
}
