import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:provider/provider.dart';

class AppBarTitleCustom extends StatelessWidget {
  const AppBarTitleCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final amountProvider = Provider.of<AmountProvider>(context);
    var currentAmount = cardService.currentAmount.round();
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              splashRadius: 20,
              onPressed: () {
                amountProvider.changeIconState();
              },
              icon: amountProvider.iconState == true
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          amountProvider.iconState == true
              ? GestureDetector(
                  onTap: () => amountProvider.changeIconState(),
                  child: Text('Gs. $currentAmount'))
              : GestureDetector(
                  onTap: () => amountProvider.changeIconState(),
                  child: const Text('*********'),
                ),
        ],
      ),
    );
  }
}
