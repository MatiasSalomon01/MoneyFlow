import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final modalOptionsProvider = Provider.of<ModelOptionsProvider>(context);
    final alertProvider = Provider.of<AlertProvider>(context);
    final dateProvider = Provider.of<DateProvider>(context);
    final amountProvider = Provider.of<AmountProvider>(context);
    //cardService.getTotalAmount(cardService.cards);

    int totalCards = cardService.cards.length;

    //double _height = 0;

    //bool onDelete = true;

    // if (cardService.isLoading)
    //   return Center(
    //     child: CircularProgressIndicator(
    //       color: Colors.red,
    //     ),
    //   );
    var currentAmount = cardService.currentAmount.round();

    bool iconState = true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.centerRight,
          child: totalCards > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          amountProvider.changeIconState();
                        },
                        icon: amountProvider.iconState == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    amountProvider.iconState == true
                        ? Text('Gs. ${currentAmount}')
                        : Text('*********'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.visibility),
                    SizedBox(
                      width: 15,
                    ),
                    const Text('Gs. ${0}')
                  ],
                ),
        ),
      ),
      drawer: SideMenu(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (cardService.isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
          GestureDetector(
            /*onLongPress: () {
              modalOptionsProvider
                  .changeHeight(MediaQuery.of(context).size.height);
            },*/
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: dateProvider.filterButtons.length,
                      itemBuilder: (context, index) {
                        return DateButton(
                          name: dateProvider.filterButtons[index].month,
                          id: dateProvider.filterButtons[index].id,
                          state: dateProvider.filterButtons[index].state,
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          cardService.loadCards();
                          dateProvider.resetAllState();
                        },
                        icon: Icon(Icons.replay_outlined)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    child: RefreshIndicator(
                      displacement: 5,
                      onRefresh: () async {
                        cardService.loadCardsFiltered(
                          DateProvider.selectedMonth,
                        );
                        //dateProvider.resetAllExcept(DateProvider.selectedMonth);
                        //totalCards = cardService.cards.length;
                      },
                      child: totalCards == 0
                          ? const Center(
                              child: Text(
                              'Cargando...' /*'No hay datos'*/,
                              style: TextStyle(fontSize: 20),
                            ))
                          : ListView.builder(
                              padding: const EdgeInsets.only(bottom: 80),
                              shrinkWrap: true,
                              itemCount: totalCards,
                              itemBuilder: (context, index) {
                                return CardData(
                                  description:
                                      cardService.cards[index].description,
                                  date: cardService.cards[index].date,
                                  amount: cardService.cards[index].amount,
                                  state: cardService.cards[index].state,
                                  id: cardService.cards[index].id!,
                                  index: index,
                                );
                              },
                            ),
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
                          date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
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
          ),
          Container(
            width: double.infinity,
            height: modalOptionsProvider.height,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      modalOptionsProvider.closeModalOptions(0);
                    },
                    child: Container(
                      color: Colors.transparent.withOpacity(0.2),
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      color: const Color.fromARGB(255, 34, 34, 34),
                      // color: Colors.red,
                      width: double.infinity,
                      height: modalOptionsProvider.height,
                      child: ListView(
                        children: [
                          ListTile(
                            selectedColor: Colors.red,
                            onTap: () {
                              //print(modalOptionsProvider.index);
                              alertProvider.changeDelete(true);
                              // modalOptionsProvider
                              //     .deleteCard(modalOptionsProvider.idCard);
                              // modalOptionsProvider.closeModalOptions(0);
                            },
                            leading: const Icon(
                              Icons.delete,
                              size: 25,
                            ),
                            title: const Text(
                              'Eliminar',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              //cardService.loadCards();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormScreen(
                                    cardInfo: CardInfo(
                                      amount: 0,
                                      description: '',
                                      state: true,
                                      date: DateFormat('dd/MM/yyyy')
                                          .format(DateTime.now()),
                                    ),
                                    buttonType: 1,
                                    buttonText: 'Agregar',
                                  ),
                                ),
                              );
                              modalOptionsProvider.closeModalOptions(0);
                            },
                            leading: const Icon(
                              Icons.add,
                              size: 25,
                            ),
                            title: const Text(
                              'Agregar',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormScreen(
                                    cardInfo: modalOptionsProvider.cardInfo,
                                    buttonType: 2,
                                    buttonText: 'Actualizar',
                                  ),
                                ),
                              );
                              modalOptionsProvider.closeModalOptions(0);
                            },
                            leading: const Icon(
                              Icons.update,
                              size: 25,
                            ),
                            title: const Text(
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
          ,
          alertProvider.onDelete == true
              ? AlertDialog(
                  title: Text('Eliminar'),
                  content: Text('Seguro que quieres eliminar este Card?'),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: TextButton(
                        onPressed: () {
                          modalOptionsProvider.closeModalOptions(0);
                          alertProvider.changeDelete(false);
                        },
                        child: Text('Cancelar'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        cardService.cards.removeAt(modalOptionsProvider.index);
                        cardService.getTotalAmount(cardService.cards);
                        modalOptionsProvider
                            .deleteCard(modalOptionsProvider.idCard);
                        modalOptionsProvider.closeModalOptions(0);
                        alertProvider.changeDelete(false);
                      },
                      child: Text('Si'),
                    ),
                  ],
                )
              : Container(),
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
