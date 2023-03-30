import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyC049bKHwkj42AhOdZz0mwbPUwXQP3kEr8';

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password
    };

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signUp',
      {"key": _firebaseToken},
    );

    final res = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeRes = json.decode(res.body);

    print(decodeRes);
  }
}
