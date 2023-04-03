import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _iconState = true;

  String get email => _email;
  String get password => _password;
  bool get iconState => _iconState;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  set iconState(bool iconState) {
    _iconState = iconState;
    notifyListeners();
  }
}
