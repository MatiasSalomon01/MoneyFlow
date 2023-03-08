import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? initialValue;
  final String labelText;
  final String helperText;
  final TextInputType? keyboardType;

  const TextFormFieldCustom(
      {super.key,
      this.initialValue,
      required this.labelText,
      required this.helperText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      //initialValue: '${DateFormat('dd/MM/yyyy').format(date)}',
      decoration: InputDecoration(labelText: labelText, helperText: helperText),
    );
  }
}
