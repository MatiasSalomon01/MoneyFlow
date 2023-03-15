import 'dart:convert';

class CardInfo {
  double amount;
  String date;
  String time;
  String description;
  bool state;
  String? id;

  CardInfo(
      {required this.amount,
      required this.date,
      required this.description,
      required this.state,
      required this.time,
      this.id});

  factory CardInfo.fromRawJson(String str) =>
      CardInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardInfo.fromJson(Map<String, dynamic> json) => CardInfo(
      amount: json["amount"].toDouble(),
      date: json["date"],
      description: json["description"],
      state: json["state"],
      time: json["time"] ?? '');

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "date": date,
        "description": description,
        "state": state,
        "time": time
      };
}
