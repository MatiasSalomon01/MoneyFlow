import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';

//enum States { ingreso, egreso }

class RadioListTileCustom extends StatefulWidget {
  final int selected;
  final bool state;
  FormProvider formProvider;
  final CardInfo cardInfo;
  RadioListTileCustom(
      {super.key,
      required this.selected,
      required this.formProvider,
      required this.state,
      required this.cardInfo});

  @override
  State<RadioListTileCustom> createState() =>
      _RadioListTileCustomState(selected, cardInfo, state, formProvider);
}

class _RadioListTileCustomState extends State<RadioListTileCustom> {
  int? selected;
  FormProvider formProvider;
  bool state;
  //int? _value = selected;
  CardInfo cardInfo;

  _RadioListTileCustomState(
      this.selected, this.cardInfo, this.state, this.formProvider);
  //States? _state = States.ingreso;

  @override
  Widget build(BuildContext context) {
    //formProvider.saveInput(state, 3);
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text('Ingreso'),
            value: 1,
            groupValue: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
                formProvider.saveInput(true, 3, cardInfo.id ?? '');
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text('Egreso'),
            value: 2,
            groupValue: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
                formProvider.saveInput(false, 3, cardInfo.id ?? '');
              });
            },
          ),
        )
      ],
    );
  }
}
