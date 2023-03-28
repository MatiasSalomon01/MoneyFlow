import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<DropdownMenuItem<int>> menuItems = [
    DropdownMenuItem(child: Text('Fecha'), value: 1),
    DropdownMenuItem(child: Text('Descripcion'), value: 2),
    DropdownMenuItem(child: Text('Monto'), value: 3),
    DropdownMenuItem(child: Text('Ingreso'), value: 4),
    DropdownMenuItem(child: Text('Egreso'), value: 5)
  ];

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Row(
          children: [
            Form(
              child: Expanded(
                child: Container(
                  // color: Colors.green,
                  padding: EdgeInsets.only(right: 30, left: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Buscar',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              // color: Colors.red,
              child: DropdownButton(
                value: _value,
                items: menuItems,
                onChanged: (value) {
                  _value = value!;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// List<DropdownMenuItem> getMenuItems() {}
