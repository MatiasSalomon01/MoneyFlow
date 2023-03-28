import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Row(
          children: const [
            _SearchBar(),
            _DropDownButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
      ),
    );
  }
}

class _DropDownButton extends StatefulWidget {
  const _DropDownButton({
    super.key,
  });

  @override
  State<_DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<_DropDownButton> {
  int _value = 1;
  List<DropdownMenuItem<int>> menuItems = [
    DropdownMenuItem(child: Text('Fecha'), value: 1),
    DropdownMenuItem(child: Text('Descripcion'), value: 2),
    DropdownMenuItem(child: Text('Monto'), value: 3),
    DropdownMenuItem(child: Text('Ingreso'), value: 4),
    DropdownMenuItem(child: Text('Egreso'), value: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Expanded(
        child: Container(
          // color: Colors.green,
          padding: EdgeInsets.only(right: 30, left: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Buscar',
              // prefixIcon: Icon(
              //   Icons.search,
              // ),
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
    );
  }
}

// List<DropdownMenuItem> getMenuItems() {}
