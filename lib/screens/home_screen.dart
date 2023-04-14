import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final alertProvider = Provider.of<AlertProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitleCustom(),
      ),
      drawer: const SideMenu(),
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
                const SizedBox(height: 20),
                Expanded(flex: 1, child: FilterButtons()),
                const SizedBox(height: 10),
                const Expanded(flex: 18, child: CardsDeployment()),
              ],
            ),
          ),
          const FloatingActionButtonCustom(),
          const Modal(),
          alertProvider.onDelete == true
              ? const AlertDialogCustom()
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
