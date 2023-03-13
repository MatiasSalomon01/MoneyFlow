import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/theme/theme.dart';

class DateProvider extends ChangeNotifier {
  final Map<int, String> dates = {
    1: 'Enero',
    2: 'Febrero',
    3: 'Marzo',
    4: 'Abril',
    5: 'Mayo',
    6: 'Junio',
    7: 'Julio',
    8: 'Agosto',
    9: 'Septiembre',
    10: 'Octubre',
    11: 'Noviembre',
    12: 'Diciembre'
  };
  final Map<int, bool> datesColors = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
    10: false,
    11: false,
    12: false
  };
  changetoTrue(index) {
    if (datesColors[index] == false) {
      datesColors[index] = true;
    }
    notifyListeners();
    datesColors.forEach((key, value) {
      print("$key -  $value");
    });
    // if (datesColors[index] == true) {
    //   datesColors[index] = false;
    //   notifyListeners();
    // }
    // if (datesColors[index] == true) {
    //   datesColors[index] = false;
    //   notifyListeners();
    // }
  }

  setState(index, bool state) {
    datesColors[index] == state;

    //notifyListeners();
  }

  // changetoFalse(index) {
  //   if (datesColors[index] == true) {
  //     datesColors[index] = false;
  //   }
  // notifyListeners();
  // datesColors.forEach((key, value) {
  //   print("$key -  $value");
}
  // if (datesColors[index] == true) {
  //   datesColors[index] = false;
  //   notifyListeners();
  // }
  // if (datesColors[index] == true) {
  //   datesColors[index] = false;
  //   notifyListeners();
  // }

  // changeState(int index, bool state) {
  //   datesColors[index] = state;
  //   notifyListeners();
  // }

