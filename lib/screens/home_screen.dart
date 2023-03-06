import 'package:flutter/material.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:money_flow/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Flow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            CardData(
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
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
