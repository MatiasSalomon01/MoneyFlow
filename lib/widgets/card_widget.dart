import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  final String description;
  final String date;
  final double amount;
  final bool state;

  const CardData(
      {super.key,
      required this.description,
      required this.date,
      required this.amount,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'form');
      },
      child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
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
                          )),
                Expanded(
                  flex: 2,
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
                          date,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '${amount.round()}',
                            style: const TextStyle(fontSize: 20),
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
