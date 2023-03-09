import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final modalOptionsProvider = Provider.of<ModelOptionsProvider>(context);

    //cardService.getTotalAmount(cardService.cards);

    int totalCards = cardService.cards.length;

    double _height = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Gs. ${cardService.currentAmount.round()}'),
        ),
      ),
      drawer: SideMenu(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onLongPress: () {
              modalOptionsProvider
                  .changeHeight(MediaQuery.of(context).size.height);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      cardService.loadCards();
                      //totalCards = cardService.cards.length;
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 80),
                      shrinkWrap: true,
                      itemCount: totalCards > 0 ? totalCards : 0,
                      itemBuilder: (context, index) {
                        return CardData(
                          description: cardService.cards[index].description,
                          date: cardService.cards[index].date,
                          amount: cardService.cards[index].amount,
                          state: cardService.cards[index].state,
                          id: cardService.cards[index].id!,
                        );
                      },
                    ),
                  ),
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
                //SizedBox(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 20, right: 10),
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
                            date: DateFormat('dd/MM/yyyy')
                                .format(DateTime.now())),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: modalOptionsProvider.height,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () => modalOptionsProvider.changeHeight(0),
                    child: Container(
                      color: Colors.transparent.withOpacity(0.2),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Container(
                      color: Color.fromARGB(255, 34, 34, 34),
                      width: double.infinity,
                      height: modalOptionsProvider.height,
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: () => print('eliminar'),
                            leading: Icon(
                              Icons.delete,
                              size: 25,
                            ),
                            title: Text(
                              'Eliminar',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.add,
                              size: 25,
                            ),
                            title: Text(
                              'Agregar',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.update,
                              size: 25,
                            ),
                            title: Text(
                              'Actualizar',
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
          /*GestureDetector(
            //onTap: () => modalOptionsProvider.changeHeight(0),
            child: Container(
              color: Color.fromARGB(255, 34, 34, 34),
              width: double.infinity,
              height: modalOptionsProvider.height,
              child: ListView(
                children: [
                  ListTile(
                    onTap: () => print('eliminar'),
                    leading: Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    title: Text(
                      'Eliminar',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add,
                      size: 25,
                    ),
                    title: Text(
                      'Agregar',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.update,
                      size: 25,
                    ),
                    title: Text(
                      'Actualizar',
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
          )*/
        ],
      ),
      /*bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          /*selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,*/
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined), label: 'Boton1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_chart_sharp), label: 'Boton2')
          ]),*/
    );
  }
}
