import 'package:flutter/material.dart';
import 'package:money_flow/theme/theme.dart';

class DateButton extends StatelessWidget {
  final String month;
  const DateButton({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          month,
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: ThemeApp.mainDarkColor),
      ),
    );
  }
}
