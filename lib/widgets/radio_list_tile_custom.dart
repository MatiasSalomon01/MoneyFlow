import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';

//enum States { ingreso, egreso }

class RadioListTileCustom extends StatefulWidget {
  final int selected;
  final bool state;
  FormProvider formProvider;
  RadioListTileCustom(
      {super.key,
      required this.selected,
      required this.formProvider,
      required this.state});

  @override
  State<RadioListTileCustom> createState() =>
      _RadioListTileCustomState(selected, formProvider, state);
}

class _RadioListTileCustomState extends State<RadioListTileCustom> {
  int? selected;
  FormProvider formProvider;
  bool state;
  //int? _value = selected;

  _RadioListTileCustomState(this.selected, this.formProvider, this.state);
  //States? _state = States.ingreso;

  @override
  Widget build(BuildContext context) {
    //formProvider.saveInput(state, 3);
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
                formProvider.saveInput(true, 3);
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
                formProvider.saveInput(false, 3);
              });
            },
          ),
        )
      ],
    );
  }
}
