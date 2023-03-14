import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:provider/provider.dart';

class DateButton extends StatelessWidget {
  final String name;
  final int index;
  final bool state;
  const DateButton(
      {super.key,
      required this.name,
      required this.index,
      required this.state});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    // if (DateTime.now().month == index - 1)
    //   dateProvider.changeState(index, !state);
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: () {
            dateProvider.changeState(index, !state);
          },
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: state ? Colors.red : ThemeApp.mainDarkColor),
          child: Text(
            name,
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
