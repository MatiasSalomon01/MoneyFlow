import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:http/http.dart' as http;

class CardService extends ChangeNotifier {
  final String _baseUrl = 'moneyflow-b3a9a-default-rtdb.firebaseio.com';

  final List<CardInfo> cards = [];

  late CardInfo cardInfo;

  double _currentAmount = 0;

  double get currentAmount => _currentAmount;

  CardService() {
    loadCards();
  }

  Future<List<CardInfo>> loadCards() async {
    final url = Uri.https(_baseUrl, 'card.json');
    final res = await http.get(url);

    if (res.body != 'null') {
      final Map<String, dynamic> cardsMap = json.decode(res.body);

      cardsMap.forEach((key, value) {
        final tempCard = CardInfo.fromJson(value);
        tempCard.id = key;
        cards.add(tempCard);
        getTotalAmount(cards);
      });
    }

    notifyListeners();
    return cards;
  }

  double getTotalAmount(List<CardInfo> cards) {
    _currentAmount = 0;
    for (var card in cards) {
      if (card.state == true) _currentAmount += card.amount;
      if (card.state == false) _currentAmount -= card.amount;
    }
    return _currentAmount;
  }
}
