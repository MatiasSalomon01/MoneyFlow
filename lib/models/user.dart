import 'dart:convert';

class User {
  User({required this.email, required this.id});

  String email;
  String id;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], email: json["email"]);

  Map<String, dynamic> toJson() => {"id": id, "email": email};
}
