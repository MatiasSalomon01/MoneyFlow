import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:provider/provider.dart';

class DateButton extends StatelessWidget {
  final int index;
  final int id;
  final String name;
  final bool state;
  const DateButton(
      {super.key,
      required this.name,
      required this.index,
      required this.state,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final cardService = Provider.of<CardService>(context);
    // if (DateTime.now().month == index - 1)
    //   dateProvider.changeState(index, !state);
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: () {
            dateProvider.changeState(index, !state);
            cardService.loadCardsFiltered(id);
          },
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: state
                  ? Color.fromARGB(255, 126, 125, 125)
                  : ThemeApp.mainDarkColor),
          child: Text(name, style: TextStyle(fontSize: 18)),
        ));
  }
}
