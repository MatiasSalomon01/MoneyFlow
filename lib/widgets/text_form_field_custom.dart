import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? initialValue;
  final String labelText;
  final String helperText;
  final TextInputType? keyboardType;
  dynamic dataInput;
  FormProvider formProvider;

  TextFormFieldCustom({
    super.key,
    this.initialValue,
    required this.labelText,
    required this.helperText,
    this.keyboardType,
    required this.dataInput,
    required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    getInput(initialValue, formProvider, labelText);
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      //initialValue: '${DateFormat('dd/MM/yyyy').format(date)}',
      decoration: InputDecoration(labelText: labelText, helperText: helperText),
      onChanged: (value) {
        getInput(value, formProvider, labelText);
      },
    );
  }

  static getInput(dynamic value, FormProvider formProvider, String labelText) {
    if (labelText == 'Fecha') formProvider.saveInput(value, 0);
    if (labelText == 'Descripcion') formProvider.saveInput(value, 1);
    if (labelText == 'Monto') formProvider.saveInput(value, 2);
  }
}
