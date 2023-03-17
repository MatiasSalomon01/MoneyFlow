import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CardsDeployment extends StatelessWidget {
  const CardsDeployment({super.key});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    int totalCards = cardService.cards.length;
    return Container(
      child: RefreshIndicator(
        displacement: 5,
        onRefresh: () async {
          if (DateProvider.selectedMonth == 0) {
            cardService.loadCards(false);
          }
          if (DateProvider.selectedMonth != 0) {
            cardService.loadCardsFiltered(
              DateProvider.selectedMonth,
              false,
            );
          }
        },
        child: cardService.isLoading
            ? const Center(
                child: Text(
                  '   Cargando...',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : cardService.cards.length > 0
                ? ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    shrinkWrap: true,
                    itemCount: totalCards,
                    itemBuilder: (context, index) {
                      return CardData(
                        description: cardService.cards[index].description,
                        date: cardService.cards[index].date,
                        time: cardService.cards[index].time,
                        amount: cardService.cards[index].amount,
                        state: cardService.cards[index].state,
                        id: cardService.cards[index].id!,
                        index: index,
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No hay Datos',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
      ),
    );
  }
}
