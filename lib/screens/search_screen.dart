import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
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
        onPressed: () async {
          // print(searchBarProvider.input);
          var allCards = await cardService.getCards();
          allCards.forEach((i) {
            if (i.description.toLowerCase().contains(
                    searchScreenProvider.input.toString().toLowerCase()) &&
                searchScreenProvider.menuItemOption == 2) {
              print(
                  "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
            if (i.amount == double.tryParse(searchScreenProvider.input) &&
                searchScreenProvider.menuItemOption == 3) {
              print(
                  "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
            if (i.date == searchScreenProvider.input &&
                searchScreenProvider.menuItemOption == 1) {
              print(
                  "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
          });
        },
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
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
    return Container(
      padding: EdgeInsets.only(right: 20),
      // color: Colors.red,
      child: DropdownButton(
        value: _value,
        items: menuItems,
        onChanged: (value) {
          _value = value!;
          searchScreenProvider.menuItemOption = value;
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
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
    return Form(
      child: Expanded(
        child: Container(
          // color: Colors.green,
          padding: EdgeInsets.only(right: 30, left: 20),
          child: TextFormField(
            // controller: TextEditingController(
            //     // text: searchScreenProvider.dateChoosed != "null"
            //     //     ? DateFormat('dd/MM/yyyy').format(
            //     //         searchScreenProvider.dateChoosed,
            //     //       )
            //     //     : searchScreenProvider.input),
            //     text: searchScreenProvider.input),
            controller: searchScreenProvider.menuItemOption != 1
                ? null
                : TextEditingController(
                    text: searchScreenProvider.dateChoosed != "null"
                        ? searchScreenProvider.input
                        : ''),
            keyboardType: searchScreenProvider.menuItemOption == 3
                ? TextInputType.number
                : searchScreenProvider.menuItemOption == 1
                    ? TextInputType.none
                    : TextInputType.text,
            onChanged: (value) {
              searchScreenProvider.input = value;
            },
            onTap: () {
              if (searchScreenProvider.menuItemOption == 1) {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                ).then((value) {
                  if (value != null) {
                    searchScreenProvider.input =
                        DateFormat('dd/MM/yyyy').format(value);
                  } else {
                    searchScreenProvider.input = '';
                  }
                });
                // searchScreenProvider.input = ;
              }
            },
            decoration: const InputDecoration(
              labelText: 'Buscar',
              // prefixIcon: Icon(
              //   Icons.search,
              // );
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
