import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/theme/theme.dart';

class DateProvider extends ChangeNotifier {
  static final int currentMonth = DateTime.now().month;
  static late int selectedMonth;
  int alreadyDone = 0;

  List<DataButtons> filterButtons = [
    DataButtons(1, 'Enero', false, false),
    DataButtons(2, 'Febrero', false, false),
    DataButtons(3, 'Marzo', false, false),
    DataButtons(4, 'Abril', false, false),
    DataButtons(5, 'Mayo', false, false),
    DataButtons(6, 'Junio', false, false),
    DataButtons(7, 'Julio', false, false),
    DataButtons(8, 'Agosto', false, false),
    DataButtons(9, 'Septiembre', false, false),
    DataButtons(10, 'Octubre', false, false),
    DataButtons(11, 'Noviembre', false, false),
    DataButtons(12, 'Diciembre', false, false)
  ];

  DateProvider() {
    checkCurrentMonth();
  }

  changeState(int index, bool value) {
    if (filterButtons[index].state == true) {
      return;
    }

    filterButtons[index].isPressed = value;
    filterButtons[index].state = value;
    resetAllExcept(filterButtons[index].id);
    selectedMonth = filterButtons[index].id;

    notifyListeners();
  }

  checkCurrentMonth() {
    for (var i in filterButtons) {
      if (currentMonth == i.id) {
        i.state = true;
        selectedMonth = i.id;
      }
    }
  }

  resetAllState() {
    for (var i in filterButtons) {
      i.state = false;
      notifyListeners();
    }
    //checkCurrentMonth();
  }

  resetAllExcept(int id) {
    for (var i in filterButtons) {
      if (i.id == id) {
        continue;
      }
      i.state = false;
      notifyListeners();
    }
  }

  // filterByMonth(int month) {

  // }
}

class DataButtons {
  int id;
  String month;
  bool state;
  bool isPressed;

  DataButtons(this.id, this.month, this.state, this.isPressed);
}
