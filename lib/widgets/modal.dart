import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:provider/provider.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    final modalOptionsProvider = Provider.of<ModelOptionsProvider>(context);
    final alertProvider = Provider.of<AlertProvider>(context);
    return Container(
      width: double.infinity,
      height: modalOptionsProvider.height,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                modalOptionsProvider.closeModalOptions(0);
                modalOptionsProvider.activateAnimation = false;
              },
              child: Container(
                color: Colors.transparent.withOpacity(0.2),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SlideInUp(
                duration: Duration(milliseconds: 200),
                animate: modalOptionsProvider.activateAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  color: const Color.fromARGB(255, 34, 34, 34),
                  // color: Colors.red,
                  width: double.infinity,
                  height: modalOptionsProvider.height,
                  child: ListView(
                    children: [
                      ListTile(
                        selectedColor: Colors.red,
                        onTap: () {
                          alertProvider.changeDelete(true);
                        },
                        leading: const Icon(
                          Icons.delete,
                          size: 25,
                        ),
                        title: const Text(
                          'Eliminar',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormScreen(
                                cardInfo: CardInfo(
                                  amount: 0,
                                  description: '',
                                  state: true,
                                  date: DateFormat('dd/MM/yyyy').format(
                                    DateTime.now(),
                                  ),
                                  time:
                                      '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                                ),
                                buttonType: 1,
                                buttonText: 'Agregar',
                              ),
                            ),
                          );
                          modalOptionsProvider.closeModalOptions(0);
                        },
                        leading: const Icon(
                          Icons.add,
                          size: 25,
                        ),
                        title: const Text(
                          'Agregar',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormScreen(
                                cardInfo: modalOptionsProvider.cardInfo,
                                buttonType: 2,
                                buttonText: 'Actualizar',
                              ),
                            ),
                          );
                          modalOptionsProvider.closeModalOptions(0);
                        },
                        leading: const Icon(
                          Icons.update,
                          size: 25,
                        ),
                        title: const Text(
                          'Actualizar',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
