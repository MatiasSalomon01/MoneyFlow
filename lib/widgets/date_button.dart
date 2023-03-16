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
  bool isPressed;

  DateButton({
    super.key,
    required this.name,
    required this.index,
    required this.state,
    required this.id,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final cardService = Provider.of<CardService>(context);

    pressed() {
      //isPressed = !isPressed;
      if (index == 0) {
        dateProvider.changeState(index, !state);
        cardService.loadCards(state);
      }
      if (index != 0) {
        dateProvider.changeState(index, !state);
        cardService.loadCardsFiltered(id, state);
      }
      //isPressed = !isPressed;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: isPressed ? pressed : null,
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: state
                ? index != 0
                    ? Color.fromARGB(255, 126, 125, 125)
                    : Color.fromARGB(255, 128, 46, 46)
                : ThemeApp.mainDarkColor),
        child: Text(name, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
