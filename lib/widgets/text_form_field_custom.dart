import 'package:flutter/material.dart';
import 'package:money_flow/models/card_info.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:provider/provider.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? initialValue;
  final String labelText;
  final String helperText;
  final IconData suffixIcon;
  final Color? suffixIconColor;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final CardInfo cardInfo;
  //final TextInputFormatter? inputFormatters;
  //dynamic dataInput;
  //FormProvider formProvider;

  const TextFormFieldCustom({
    super.key,
    this.initialValue,
    required this.labelText,
    required this.helperText,
    this.keyboardType,
    required this.cardInfo,
    required this.suffixIcon,
    this.autofocus,
    this.suffixIconColor,
    //this.inputFormatters,
    //this.inputFormatters,
    // required this.dataInput,
    //required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    getInput(initialValue, formProvider, labelText, cardInfo);
    return TextFormField(
      //inputFormatters: [inputFormatters!],
      cursorColor: Colors.grey,
      cursorWidth: 2, autofocus: autofocus ?? false,
      initialValue: initialValue,
      keyboardType: keyboardType,
      // validator: (value) {
      //   String pattern = r'^[0-9]';
      //   RegExp regExp = RegExp(pattern);
      //   return regExp.hasMatch(value ?? '')
      //       ? null
      //       : 'Valor ingresado incorrecto';
      // },
      //initialValue: '${DateFormat('dd/MM/yyyy').format(date)}',
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        labelText: labelText,
        helperText: helperText,
        suffixIcon: Icon(
          suffixIcon,
          color: suffixIconColor ?? Colors.grey,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        getInput(value, formProvider, labelText, cardInfo);
      },
    );
  }

  static getInput(dynamic value, FormProvider formProvider, String labelText,
      CardInfo cardInfo) {
    //print(cardInfo.id);
    if (labelText == 'Fecha') {
      formProvider.saveInput(value, 0, cardInfo.id ?? '');
    }
    if (labelText == 'Descripcion') {
      formProvider.saveInput(value, 1, cardInfo.id ?? '');
    }
    if (labelText == 'Monto') {
      formProvider.saveInput(value, 2, cardInfo.id ?? '');
    }
  }
}
