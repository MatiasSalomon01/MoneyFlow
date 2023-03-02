import 'package:flutter/material.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:money_flow/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeApp.mainLightColor,
        title: const Text('Money Flow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            CardData(type: 'Ingreso', description: 'Salario', amount: 250000, state: true,),
            CardData(type: 'Egreso', description: 'Pago de Pasaje Linea 30 Rojo', amount: 3400, state: false,),
            CardData(type: 'Ingreso', description: 'Bonus Alimenticio', amount: 400000, state: true,),
            CardData(type: 'Egreso', description: 'Soporte de Notebook Quanta', amount: 99301, state: false,),
            
          ],
        ),
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