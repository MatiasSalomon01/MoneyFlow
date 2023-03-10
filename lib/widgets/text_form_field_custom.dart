import 'package:flutter/material.dart';
import 'package:money_flow/models/card_info.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:provider/provider.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? initialValue;
  final String labelText;
  final String helperText;
  final TextInputType? keyboardType;
  final CardInfo cardInfo;
  //dynamic dataInput;
  //FormProvider formProvider;

  TextFormFieldCustom({
    super.key,
    this.initialValue,
    required this.labelText,
    required this.helperText,
    this.keyboardType,
    required this.cardInfo,
    // required this.dataInput,
    //required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    getInput(initialValue, formProvider, labelText, cardInfo);
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      //initialValue: '${DateFormat('dd/MM/yyyy').format(date)}',
      decoration: InputDecoration(labelText: labelText, helperText: helperText),
      onChanged: (value) {
        getInput(value, formProvider, labelText, cardInfo);
      },
    );
  }

  static getInput(dynamic value, FormProvider formProvider, String labelText,
      CardInfo cardInfo) {
    //print(cardInfo.id);
    if (labelText == 'Fecha')
      formProvider.saveInput(value, 0, cardInfo.id ?? '');
    if (labelText == 'Descripcion')
      formProvider.saveInput(value, 1, cardInfo.id ?? '');
    if (labelText == 'Monto')
      formProvider.saveInput(value, 2, cardInfo.id ?? '');
  }
}
