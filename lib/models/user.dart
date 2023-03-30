import 'dart:convert';

class User {
  User({required this.email, this.id});

  String email;
  String? id;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
