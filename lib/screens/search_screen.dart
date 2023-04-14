import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [_SearchBar(), _DropDownButton()],
                  ),
                ),
                const SizedBox(height: 20),
                _CardsDeployment(searchScreenProvider: searchScreenProvider),
                // const SizedBox(height: 80),
              ],
            ),
          ),
          _FloatingActionButtonCustom(
            cardService: cardService,
            searchScreenProvider: searchScreenProvider,
          ),
          const Modal(),
        ],
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
        padding: const EdgeInsets.only(bottom: 80),
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
  // List<DropdownMenuItem<int>> menuItems = [
  //   DropdownMenuItem(
  //     value: 1,
  //     child: Row(
  //       children: const [
  //         Icon(Icons.check),
  //         SizedBox(width: 15),
  //         Text('Fecha'),
  //       ],
  //     ),
  //   ),
  //   DropdownMenuItem(
  //     value: 2,
  //     child: Row(
  //       children: const [
  //         Icon(Icons.check),
  //         SizedBox(width: 15),
  //         Text('Descripcion'),
  //       ],
  //     ),
  //   ),
  //   DropdownMenuItem(
  //     value: 3,
  //     child: Row(
  //       children: const [
  //         Icon(Icons.check),
  //         SizedBox(width: 15),
  //         Text('Monto'),
  //       ],
  //     ),
  //   ),
  //   DropdownMenuItem(
  //     value: 4,
  //     child: Row(
  //       children: const [
  //         Icon(Icons.check),
  //         SizedBox(width: 15),
  //         Text('Ingreso'),
  //       ],
  //     ),
  //   ),
  //   DropdownMenuItem(
  //     value: 5,
  //     child: Row(
  //       children: const [
  //         Icon(Icons.check),
  //         SizedBox(width: 15),
  //         Text('Egreso'),
  //       ],
  //     ),
  //   )
  // ];

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value: 1, child: Text('Fecha')),
    const DropdownMenuItem(value: 2, child: Text('Descripcion')),
    const DropdownMenuItem(value: 3, child: Text('Monto')),
    const DropdownMenuItem(value: 4, child: Text('Ingreso')),
    const DropdownMenuItem(value: 5, child: Text('Egreso'))
  ];

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
    final userService = Provider.of<UserService>(context);
    return Container(
      padding: const EdgeInsets.only(right: 35),
      // color: Colors.red,
      child: DropdownButton(
        value: _value,
        items: menuItems,
        onChanged: (value) {
          _value = value!;
          searchScreenProvider.menuItemOption = value;
          searchScreenProvider.cards = [];
          displayInfo(cardService, searchScreenProvider, userService);
          setState(() {});
        },
        elevation: 8,
        dropdownColor: Preferences.isDarkMode
            ? const Color.fromARGB(255, 63, 63, 63)
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
        style: TextStyle(
          color: Preferences.isDarkMode ? Colors.white : Colors.black,
          fontSize: 18,
          // fontWeight: FontWeight.bold,
        ),
        underline: Container(
          height: 1,
          color: Preferences.isDarkMode ? Colors.white : Colors.black,
        ),
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
    final cardService = Provider.of<CardService>(context);
    final searchScreenProvider = Provider.of<SearchScreenProvider>(context);
    final userService = Provider.of<UserService>(context);
    return Form(
      child: Expanded(
        child: Container(
          // color: Colors.green,
          padding: const EdgeInsets.only(right: 30, left: 20),
          child: TextFormField(
            cursorColor: Colors.grey,
            controller: searchScreenProvider.menuItemOption != 1
                ? null
                : TextEditingController(
                    text: searchScreenProvider.dateChoosed != "null"
                        ? searchScreenProvider.input
                        : '',
                  ),
            keyboardType: searchScreenProvider.menuItemOption == 3
                ? TextInputType.number
                : searchScreenProvider.menuItemOption == 1
                    ? TextInputType.none
                    : TextInputType.text,
            onChanged: (value) {
              searchScreenProvider.input = value;
              displayInfo(cardService, searchScreenProvider, userService);
              // print(searchScreenProvider.cards.length);
            },
            onTap: () {
              if (searchScreenProvider.menuItemOption == 1) {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2025),
                ).then((value) {
                  if (value != null) {
                    searchScreenProvider.input =
                        DateFormat('dd/MM/yyyy').format(value);
                  } else {
                    searchScreenProvider.input = '';
                  }
                });
              }
            },
            decoration: InputDecoration(
              labelText: 'Buscar',
              floatingLabelStyle: TextStyle(
                color: Preferences.isDarkMode ? Colors.white : Colors.black,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButtonCustom extends StatelessWidget {
  const _FloatingActionButtonCustom(
      {super.key,
      required this.cardService,
      required this.searchScreenProvider});

  final CardService cardService;
  final SearchScreenProvider searchScreenProvider;

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            displayInfo(cardService, searchScreenProvider, userService);
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}

displayInfo(CardService cardService, SearchScreenProvider searchScreenProvider,
    UserService userService) async {
  List<CardInfo> searchCards = [];
  int totalFound = 0;

  var allCards = await cardService.getCards(Preferences.id);

  allCards.forEach((i) {
    if (searchScreenProvider.menuItemOption == 1 &&
        i.date == searchScreenProvider.input) {
      searchCards.add(i);
    }
    if (searchScreenProvider.menuItemOption == 2 &&
        i.description
            .toLowerCase()
            .contains(searchScreenProvider.input.toString().toLowerCase())) {
      searchCards.add(i);
    }
    if (searchScreenProvider.menuItemOption == 3 &&
        i.amount == double.tryParse(searchScreenProvider.input)) {
      searchCards.add(i);
    }
    if (searchScreenProvider.menuItemOption == 4 &&
        i.description
            .toLowerCase()
            .contains(searchScreenProvider.input.toString().toLowerCase()) &&
        i.state == true) {
      searchCards.add(i);
    }
    if (searchScreenProvider.menuItemOption == 5 &&
        i.description
            .toLowerCase()
            .contains(searchScreenProvider.input.toString().toLowerCase()) &&
        i.state == false) {
      searchCards.add(i);
    }
    totalFound = searchCards.length;
  });

  if (totalFound > 0) {
    searchScreenProvider.cards = searchCards;
  } else {
    searchScreenProvider.cards = [];
  }
}
