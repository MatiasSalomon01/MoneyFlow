import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:http/http.dart' as http;

class CardService extends ChangeNotifier {
  final String _baseUrl = 'moneyflow-b3a9a-default-rtdb.firebaseio.com';

  final List<CardInfo> cards = [];

  late CardInfo cardInfo;

  CardService() {
    loadCards();
  }

  Future<List<CardInfo>> loadCards() async {
    final url = Uri.https(_baseUrl, 'card.json');
    final res = await http.get(url);

    final Map<String, dynamic> cardsMap = json.decode(res.body);

    cardsMap.forEach((key, value) {
      final tempCard = CardInfo.fromJson(value);
      tempCard.id = key;
      cards.add(tempCard);
    });

    notifyListeners();

    return cards;
  }
}
