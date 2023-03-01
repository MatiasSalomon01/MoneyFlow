import 'package:flutter/material.dart';
import 'package:money_flow/theme/theme.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeApp.mainLightColor,
        title: const Text('Money Flow'),
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ThemeApp.mainLightColor,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Boton1'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_sharp),
            label: 'Boton2'
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ThemeApp.mainLightColor,
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}