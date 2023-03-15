import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:provider/provider.dart';

class CardData extends StatelessWidget {
  final String description;
  final String date;
  final double amount;
  final bool state;
  final String time;
  final String id;
  final int index;

  const CardData(
      {super.key,
      required this.description,
      required this.date,
      required this.amount,
      required this.state,
      required this.time,
      required this.id,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final modalOptionsProvider = Provider.of<ModelOptionsProvider>(context);
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, 'form');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormScreen(
              cardInfo: CardInfo(
                  id: id,
                  amount: amount,
                  date: date,
                  time: time,
                  description: description,
                  state: state),
              buttonType: 2,
              buttonText: 'Actualizar',
            ),
          ),
        );
      },
      onLongPress: () {
        modalOptionsProvider.openModalOptions(
            MediaQuery.of(context).size.height,
            id,
            index,
            CardInfo(
                id: id,
                amount: amount,
                date: date,
                time: time,
                description: description,
                state: state));
      },
      child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 60,
                  child: state == true
                      ? const Icon(
                          Icons.arrow_drop_up,
                          size: 50,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.arrow_drop_down,
                          size: 50,
                          color: Colors.red,
                        ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          style: const TextStyle(fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$date ${time}',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: this.state == true
                              ? Text(
                                  '${amount.round()}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                )
                              : Text(
                                  '-${amount.round()}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
