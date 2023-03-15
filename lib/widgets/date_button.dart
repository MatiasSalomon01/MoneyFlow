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
  bool? isPressed;
  //final bool isPressed;
  DateButton(
      {super.key,
      required this.name,
      required this.index,
      required this.state,
      required this.id,
      this.isPressed
      /*required this.isPressed*/
      });

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final cardService = Provider.of<CardService>(context);
    final buttonFiltersProvider = Provider.of<ButtonFiltersProvider>(context);

    x() {
      print(dateProvider.filterButtons[index].isPressed);
    }

    pressed() {
      //isPressed = false;
      x();
      dateProvider.changeState(index, !state);
      buttonFiltersProvider.changeIsPressed();
      cardService.loadCardsFiltered(id);
    }

    // if (DateTime.now().month == index - 1)
    //   dateProvider.changeState(index, !state);
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: !cardService.isLoading ? pressed : null,
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: state
                  ? Color.fromARGB(255, 126, 125, 125)
                  : ThemeApp.mainDarkColor),
          child: Text(name, style: TextStyle(fontSize: 18)),
        ));
  }
}
