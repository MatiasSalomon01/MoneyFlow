import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final modalOptionsProvider = Provider.of<ModelOptionsProvider>(context);
    final alertProvider = Provider.of<AlertProvider>(context);
    final dateProvider = Provider.of<DateProvider>(context);
    final amountProvider = Provider.of<AmountProvider>(context);
    var currentAmount = cardService.currentAmount.round();

    int totalCards = cardService.cards.length;
    // var currentAmount = cardService.currentAmount.round();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitleCustom(),
      ),
      drawer: SideMenu(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (cardService.isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
          GestureDetector(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 1,
                  child: FilterButtons(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 18,
                  child: CardsDeployment(),
                ),
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
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      color: const Color.fromARGB(255, 34, 34, 34),
                      // color: Colors.red,
                      width: double.infinity,
                      height: modalOptionsProvider.height,
                      child: ListView(
                        children: [
                          ListTile(
                            selectedColor: Colors.red,
                            onTap: () {
                              alertProvider.changeDelete(true);
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
          ),
          alertProvider.onDelete == true
              ? AlertDialog(
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

                        modalOptionsProvider
                            .deleteCard(modalOptionsProvider.idCard);
                        modalOptionsProvider.closeModalOptions(0);
                        alertProvider.changeDelete(false);
                      },
                      child: const Text('Sí'),
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
