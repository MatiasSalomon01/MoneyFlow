import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/services/services.dart';

class ModelOptionsProvider extends ChangeNotifier {
  double height = 0;
  String idCard = '';
  CardInfo cardInfo = CardInfo(
      amount: 0, date: '', description: '', state: true, time: '', id: '');

  CardService cardService = CardService();

  int index = 0;

  bool _activateAnimation = false;
  bool get activateAnimation => _activateAnimation;
  set activateAnimation(bool value) {
    _activateAnimation = value;
    notifyListeners();
  }

  double openModalOptions(double value, String id, int i, CardInfo card) {
    height = value;
    idCard = id;
    cardInfo.amount = card.amount;
    cardInfo.description = card.description;
    cardInfo.date = card.date;
    cardInfo.state = card.state;
    cardInfo.id = id;
    index = i;

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

  void updateCard(selectedMonth, CardInfo cardInfo) {
    //print('Card Selecionado para actualizar: ${cardInfo.id}');
    cardService.updateCard(selectedMonth, cardInfo);
    //print(cardInfo.id);
  }

  void addCard() {}
}
