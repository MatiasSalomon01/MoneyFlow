import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';

//enum States { ingreso, egreso }

class RadioListTileCustom extends StatefulWidget {
  final int selected;
  FormProvider formProvider;
  RadioListTileCustom(
      {super.key, required this.selected, required this.formProvider});

  @override
  State<RadioListTileCustom> createState() =>
      _RadioListTileCustomState(selected, formProvider);
}

class _RadioListTileCustomState extends State<RadioListTileCustom> {
  int? selected;
  FormProvider formProvider;
  //int? _value = selected;

  _RadioListTileCustomState(this.selected, this.formProvider);
  //States? _state = States.ingreso;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: Text('Ingreso'),
            value: 1,
            groupValue: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
                formProvider.saveInput(value, 3);
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text('Egreso'),
            value: 2,
            groupValue: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
                formProvider.saveInput(value, 3);
              });
            },
          ),
        )
      ],
    );
  }
}
