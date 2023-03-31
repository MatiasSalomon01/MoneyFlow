import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/providers/theme_provider.dart';
import 'package:money_flow/services/services.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userService = Provider.of<UserService>(context);

    pressed() {
      //isPressed = !isPressed;
      if (index == 0) {
        dateProvider.changeState(index, !state);
        cardService.loadCards(state, userService.userLogged['id']!);
      }
      if (index != 0) {
        dateProvider.changeState(index, !state);
        cardService.loadCardsFiltered(id, state, userService.userLogged['id']!);
      }
      //isPressed = !isPressed;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: isPressed ? pressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: state
              ? index != 0
                  ? themeProvider.selectedElevatedButton
                  : themeProvider.selectedElevatedButtonSeeAll
              // state ? themeProvider.currentColor : themeProvider.currentColor
              : themeProvider.currentColor,
          foregroundColor:
              state && !Preferences.isDarkMode ? Colors.black : Colors.white,
          // : index != 0
          //     ? Color.fromARGB(255, 126, 125, 125)
          //     : Color.fromARGB(255, 128, 46, 46),
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: //state
        //       /*?*/ index != 0 || state
        //           ? Color.fromARGB(255, 126, 125, 125)
        //           : Color.fromARGB(255, 128, 46, 46),
        // ),
        // : state == false
        //     ? Color.fromARGB(255, 69, 69, 69)
        //     : Colors.red),
        child: Text(name, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
