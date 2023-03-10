import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';

class FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String date = '';
  String description = '';
  double amount = 0;
  bool state = true;
  String id = '';

  //CardInfo? cardInfo;

  //FormProvider(this.cardInfo);

  /*updateAvailability(bool value){
    cardInfo.available = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }*/

  saveInput(dynamic value, int option, String cardId) {
    if (option == 0) date = value;
    if (option == 1) description = value;
    if (option == 2) amount = value != '' ? double.parse(value) : 0;
    if (option == 3) state = value;
    id = cardId;
    //notifyListeners();
  }
}
