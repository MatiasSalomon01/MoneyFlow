import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money_flow/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:money_flow/providers/providers.dart';

class CardService extends ChangeNotifier {
  final String _baseUrl = 'moneyflow-b3a9a-default-rtdb.firebaseio.com';

  final List<CardInfo> cards = [];

  late CardInfo cardInfo;

  bool empty = false;

  bool isLoading = false;

  double _currentAmount = 0;

  double get currentAmount => _currentAmount;

  CardService() {
    loadCardsFiltered(DateTime.now().month);
  }

  Future<List<CardInfo>> loadCards() async {
    isLoading = true;
    cards.clear();

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
    if (cards.length == 0) empty = true;
    isLoading = false;

    notifyListeners();
    return cards;
  }

  Future<List<CardInfo>> loadCardsFiltered(int month) async {
    List<CardInfo> x = [];
    isLoading = true;
    cards.clear();

    final url = Uri.https(_baseUrl, 'card.json');
    final res = await http.get(url);

    if (res.body != 'null') {
      final Map<String, dynamic> cardsMap = json.decode(res.body);

      cardsMap.forEach((key, value) {
        final tempCard = CardInfo.fromJson(value);
        tempCard.id = key;

        if (tempCard.date.split('/')[1].startsWith("0")) {
          if (month == int.parse(tempCard.date.split('/')[1][1])) {
            cards.add(tempCard);
          }
        } else {
          if (month == int.parse(tempCard.date.split('/')[1])) {
            cards.add(tempCard);
          }
        }
        x.add(tempCard);
        getTotalAmount(x);
      });
    }
    if (cards.length == 0) empty = true;
    isLoading = false;

    notifyListeners();
    return cards;
  }

  double getTotalAmount(List<CardInfo> cards) {
    _currentAmount = 0;
    for (var card in cards) {
      if (card.state == true) _currentAmount += card.amount;
      if (card.state == false) _currentAmount -= card.amount;
    }
    notifyListeners();
    return _currentAmount;
  }

  Future<String> createCard(CardInfo cardInfo) async {
    final url = Uri.https(_baseUrl, 'card.json');
    final res = await http.post(url, body: cardInfo.toRawJson());

    final decodedData = json.decode(res.body);

    cardInfo.id = decodedData['name'];
    cards.add(cardInfo);
    await loadCardsFiltered(DateProvider.selectedMonth);
    return cardInfo.id!;
  }

  Future deleteCard(String id) async {
    final url = Uri.https(_baseUrl, 'card/$id.json');
    final res = await http.delete(url);
    //loadCards();

    //await loadCards();
  }

  Future<String?> updateCard(CardInfo cardInfo) async {
    // print(cardInfo.id);
    // print(cardInfo.description);
    // print(cardInfo.date);
    // print(cardInfo.amount);
    // print(cardInfo.state);

    final url = Uri.https(_baseUrl, 'card/${cardInfo.id}.json');
    final res = await http.patch(url, body: cardInfo.toRawJson());
    await loadCardsFiltered(DateProvider.selectedMonth);
    return 'Actualización Exitosa';
  }
}
