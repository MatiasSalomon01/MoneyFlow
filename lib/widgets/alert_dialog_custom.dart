import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:provider/provider.dart';

class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final modalOptionsProvider = Provider.of<ModelOptionsProvider>(context);
    final alertProvider = Provider.of<AlertProvider>(context);
    final cardService = Provider.of<CardService>(context);
    final userService = Provider.of<UserService>(context);
    return AlertDialog(
      title: const Text('Eliminar'),
      content: const Text('Seguro que quieres eliminar este Card?'),
      actions: [
        TextButton(
          onPressed: () {},
          child: TextButton(
            onPressed: () {
              modalOptionsProvider.closeModalOptions(0);
              alertProvider.changeDelete(false);
            },
            child: const Text('Cancelar'),
          ),
        ),
        TextButton(
          onPressed: () async {
            cardService.cards.removeAt(modalOptionsProvider.index);
            if (DateProvider.selectedMonth == 0) {
              cardService.getTotalAmount(cardService.cards);
              //cardService.loadCards(false);
            }
            if (DateProvider.selectedMonth != 0) {
              cardService.getCurrentTotalCards(
                  modalOptionsProvider.cardInfo.amount,
                  modalOptionsProvider.cardInfo.state);
            }

            modalOptionsProvider.deleteCard(
                modalOptionsProvider.idCard, Preferences.id);
            modalOptionsProvider.closeModalOptions(0);
            alertProvider.changeDelete(false);
          },
          child: const Text('Sí'),
        ),
      ],
    );
  }
}
