import 'package:flutter/material.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);

    //cardService.getTotalAmount(cardService.cards);

    int totalCards = cardService.cards.length;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Gs. ${cardService.currentAmount.round()}'),
        ),
      ),
      drawer: SideMenu(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: totalCards > 0 ? totalCards : 0,
                itemBuilder: (context, index) {
                  return CardData(
                      description: cardService.cards[index].description,
                      date: cardService.cards[index].date,
                      amount: cardService.cards[index].amount,
                      state: cardService.cards[index].state);
                }),
          ),
          /*CardData(
            description: 'Salario',
            date: '05/03/2023 15:25hs',
            amount: 2500000,
            state: true,
          ),
          CardData(
            description: 'Soporte de Notebook Quanta',
            date: '05/03/2023 15:25hs',
            amount: 99301,
            state: false,
          ),*/
          SizedBox(
            height: 5,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          /*selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,*/
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined), label: 'Boton1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_chart_sharp), label: 'Boton2')
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'form');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
