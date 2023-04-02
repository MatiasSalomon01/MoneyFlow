import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  final String _baseUrl = 'moneyflow-b3a9a-default-rtdb.firebaseio.com';
  // late List<User> users = [];

  Map<String, String> _userLogged = {"email": "", "id": ""};
  // late Map<String, dynamic> _allUsers;

  Map<String, String> get userLogged => _userLogged;

  static List<Map<dynamic, dynamic>> mapUsers = [];

  set userLogged(Map<String, String> map) {
    _userLogged = map;
    notifyListeners();
  }

  Future<List<User>> loadUsers() async {
    List<User> users = [];
    final url = Uri.https(_baseUrl, 'users.json');
    final res = await http.get(url);

    if (res.body != 'null') {
      final Map<String, dynamic> usersMap = json.decode(res.body);
      usersMap.forEach((key, value) {
        final tempUser = User.fromJson(value);
        tempUser.id = key;
        users.add(tempUser);
        // if (!userLogged.containsKey(key)) {
        //   userLogged["id"] = key;
        //   userLogged["email"] = value.toString();
        // }
        _userLogged["id"] = key;
        _userLogged["email"] = value.toString();
        _userLogged.addAll(_userLogged);
      });
    }
    notifyListeners();
    return users;
  }

  Future<void> createUser(User user) async {
    final url = Uri.https(_baseUrl, 'users.json');
    final res = await http.post(url, body: user.toRawJson());

    final decodedData = json.decode(res.body);

    // print(decodedData["name"]);

    return;
  }

  Future<List<Map<dynamic, dynamic>>> getMapUsers() async {
    List<Map<dynamic, dynamic>> list = [];
    final url = Uri.https(_baseUrl, 'users.json');
    final res = await http.get(url);

    final Map<String, dynamic> usersMap = json.decode(res.body);

    usersMap.forEach((key, value) {
      list.add(value);
    });
    // list.forEach((element) {
    //   print("${element.values}");
    // });
    mapUsers = list;
    // print(mapUsers);
    return list;
  }
}
