import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:provider/provider.dart';

class DateButton extends StatelessWidget {
  final String month;
  final int index;
  bool state;
  DateButton(
      {super.key,
      required this.month,
      required this.index,
      required this.state});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);

    if (DateTime.now().month == index) dateProvider.setState(index, true);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          dateProvider.setState(index, true);
          // if (dateProvider.datesColors[index] == true) {
          //   dateProvider.changetoFalse(index);
          // }
        },
        child: Text(
          month,
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: dateProvider.datesColors[index] == false
                ? ThemeApp.mainDarkColor
                : Colors.red),
      ),
    );
  }
}
