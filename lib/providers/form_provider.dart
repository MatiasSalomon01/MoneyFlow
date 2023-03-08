import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';

class FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CardInfo? cardInfo;

  FormProvider(this.cardInfo);

  /*updateAvailability(bool value){
    cardInfo.available = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }*/
}
