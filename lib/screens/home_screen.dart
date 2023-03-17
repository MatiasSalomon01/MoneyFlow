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
          FloatingActionButtonCustom(),
          Modal(),
          alertProvider.onDelete == true ? AlertDialogCustom() : Container(),
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
                dededede
          ]),*/
    );
  }
}
