import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/screens/screens.dart';

class CardData extends StatelessWidget {
  final String description;
  final String date;
  final double amount;
  final bool state;
  final String id;

  const CardData(
      {super.key,
      required this.description,
      required this.date,
      required this.amount,
      required this.state,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, 'form');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormScreen(
                      cardInfo: CardInfo(
                          amount: amount,
                          date: date,
                          description: description,
                          state: state),
                    )));
      },
      onLongPress: () {
        print(id);
        showMenu(
          color: Colors.red,
          context: context,
          position: RelativeRect.fromLTRB(40.0, 60.0, 100.0, 100.0),
          items: [
            PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Eliminar')
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
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
                          '$date',
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
                            child: this.state == true
                                ? Text(
                                    '${amount.round()}',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  )
                                : Text(
                                    '-${amount.round()}',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  RelativeRect _getRelativeRect(GlobalKey key) {
    return RelativeRect.fromSize(
        _getWidgetGlobalRect(key), const Size(200, 200));
  }

  Rect _getWidgetGlobalRect(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    debugPrint('Widget position: ${offset.dx} ${offset.dy}');
    return Rect.fromLTWH(offset.dx / 3.1, offset.dy * 1.05,
        renderBox.size.width, renderBox.size.height);
  }
}
