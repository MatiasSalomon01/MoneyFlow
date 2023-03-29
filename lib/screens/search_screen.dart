import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/card_widget.dart';
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
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              child: Row(
                children: const [
                  _SearchBar(),
                  _DropDownButton(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _CardsDeployment(searchScreenProvider: searchScreenProvider),
            const SizedBox(height: 75),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<CardInfo> searchCards = [];
          // print(searchBarProvider.input);
          var allCards = await cardService.getCards();
          allCards.forEach((i) {
            if (searchScreenProvider.menuItemOption == 1 &&
                i.date == searchScreenProvider.input) {
              searchCards.add(i);
              searchScreenProvider.cards = searchCards;
              // print(
              //     "${i.id} ${i.datjjjje} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
            if (searchScreenProvider.menuItemOption == 2 &&
                i.description.toLowerCase().contains(
                    searchScreenProvider.input.toString().toLowerCase())) {
              searchCards.add(i);
              searchScreenProvider.cards = searchCards;
              // print(
              //     "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
            if (searchScreenProvider.menuItemOption == 3 &&
                i.amount == double.tryParse(searchScreenProvider.input)) {
              searchCards.add(i);
              searchScreenProvider.cards = searchCards;
              // print(
              //     "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
            if (searchScreenProvider.menuItemOption == 4 &&
                i.description.toLowerCase().contains(
                    searchScreenProvider.input.toString().toLowerCase()) &&
                i.state == true) {
              searchCards.add(i);
              searchScreenProvider.cards = searchCards;
              // print(
              //     "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
            if (searchScreenProvider.menuItemOption == 5 &&
                i.description.toLowerCase().contains(
                    searchScreenProvider.input.toString().toLowerCase()) &&
                i.state == false) {
              searchCards.add(i);
              searchScreenProvider.cards = searchCards;
              // print(
              //     "${i.id} ${i.date} ${i.description} ${i.amount} ${i.time} ${i.state}");
            }
          });
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}

class _CardsDeployment extends StatelessWidget {
  const _CardsDeployment({
    super.key,
    required this.searchScreenProvider,
  });

  final SearchScreenProvider searchScreenProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: searchScreenProvider.cards.length,
        itemBuilder: (context, index) {
          return CardData(
            description: searchScreenProvider.cards[index].description,
            date: searchScreenProvider.cards[index].date,
            amount: searchScreenProvider.cards[index].amount,
            state: searchScreenProvider.cards[index].state,
            time: searchScreenProvider.cards[index].time,
            id: searchScreenProvider.cards[index].id!,
            index: index,
          );
        },
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
    const DropdownMenuItem(value: 1, child: Text('Fecha')),
    const DropdownMenuItem(value: 2, child: Text('Descripcion')),
    const DropdownMenuItem(value: 3, child: Text('Monto')),
    const DropdownMenuItem(value: 4, child: Text('Ingreso')),
    const DropdownMenuItem(value: 5, child: Text('Egreso'))
  ];

  @override
  Widget build(BuildContext context) {
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
    return Container(
      padding: const EdgeInsets.only(right: 20),
      // color: Colors.red,
      child: DropdownButton(
        value: _value,
        items: menuItems,
        onChanged: (value) {
          _value = value!;
          searchScreenProvider.menuItemOption = value;
          searchScreenProvider.cards = [];
          // searchScreenProvider.cards = [];
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
          padding: const EdgeInsets.only(right: 30, left: 20),
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
