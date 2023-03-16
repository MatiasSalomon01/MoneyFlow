import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:provider/provider.dart';

class DateButton extends StatefulWidget {
  final int index;
  final int id;
  final String name;
  final bool state;
  bool isPressed;
  //final bool isPressed;
  DateButton(
      {super.key,
      required this.name,
      required this.index,
      required this.state,
      required this.id,
      required this.isPressed
      /*required this.isPressed*/
      });

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final cardService = Provider.of<CardService>(context);

    pressed() {
      // dateProvider.changeIsPressed(widget.index);
      // dateProvider.changeState(widget.index, !widget.state);
      // cardService.loadCardsFiltered(widget.id);
      setState(() {
        // dateProvider.changeIsPressed(widget.index);
        if (widget.index == 0) {
          cardService.loadCards(widget.state);
        }
        widget.isPressed = !widget.isPressed;
        dateProvider.changeState(widget.index, !widget.state);
        cardService.loadCardsFiltered(widget.id);
        widget.isPressed = false;
      });
    }

    // if (DateTime.now().month == index - 1)
    //   dateProvider.changeState(index, !state);
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: widget.isPressed ? pressed : null,
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: widget.state
                  ? widget.index != 0
                      ? Color.fromARGB(255, 126, 125, 125)
                      : Color.fromARGB(255, 128, 46, 46)
                  : ThemeApp.mainDarkColor),
          child: Text(widget.name, style: TextStyle(fontSize: 18)),
        ));
  }
}
