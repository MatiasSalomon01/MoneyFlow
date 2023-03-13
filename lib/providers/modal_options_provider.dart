import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/services/services.dart';

class ModelOptionsProvider extends ChangeNotifier {
  double height = 0;
  String idCard = '';
  CardInfo cardInfo =
      CardInfo(amount: 0, date: '', description: '', state: true, id: '');

  CardService cardService = CardService();

  double openModalOptions(double value, String id, CardInfo card) {
    height = value;
    idCard = id;
    cardInfo.amount = card.amount;
    cardInfo.description = card.description;
    cardInfo.date = card.date;
    cardInfo.state = card.state;
    cardInfo.id = id;

    notifyListeners();
    return height;
  }

  double closeModalOptions(double value) {
    height = value;
    notifyListeners();
    return height;
  }

  void deleteCard(String id) {
    //print('Card Selecionado para eliminar : $id');
    cardService.deleteCard(id);
    //print(id);
    //print(cardService.empty);
  }

  void updateCard(CardInfo cardInfo) {
    //print('Card Selecionado para actualizar: ${cardInfo.id}');
    var x = cardService.updateCard(cardInfo);
    //print(cardInfo.id);
  }

  void addCard() {}
}
