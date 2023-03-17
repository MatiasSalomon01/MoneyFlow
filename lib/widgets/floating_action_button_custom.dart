import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/screens/screens.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  const FloatingActionButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(
                  cardInfo: CardInfo(
                    amount: 0,
                    description: '',
                    state: true,
                    date: DateFormat('dd/MM/yyyy').format(
                      DateTime.now(),
                    ),
                    time:
                        '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                  ),
                  buttonType: 1,
                  buttonText: 'Agregar',
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
