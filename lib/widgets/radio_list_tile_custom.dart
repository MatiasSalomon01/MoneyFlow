import 'package:flutter/material.dart';

//enum States { ingreso, egreso }

class RadioListTileCustom extends StatefulWidget {
  final int selected;
  const RadioListTileCustom({super.key, required this.selected});

  @override
  State<RadioListTileCustom> createState() =>
      _RadioListTileCustomState(selected);
}

class _RadioListTileCustomState extends State<RadioListTileCustom> {
  int? selected;
  //int? _value = selected;

  _RadioListTileCustomState(this.selected);
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
              });
            },
          ),
        )
      ],
    );
  }
}
