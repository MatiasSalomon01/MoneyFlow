import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final CardInfo cardInfo;
  final int buttonType;
  final String buttonText;

  const FormScreen(
      {super.key,
      required this.cardInfo,
      required this.buttonType,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardService>(context);
    final formProvider = Provider.of<FormProvider>(context);
    final dateProvider = Provider.of<DateProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                TextFormFieldCustom(
                  initialValue: cardInfo.date + ' ' + cardInfo.time,
                  labelText: 'Fecha',
                  helperText: 'Fecha de ocurrencia',
                  cardInfo: cardInfo,
                  suffixIcon: Icons.today_outlined,
                  //inputFormatters: FilteringTextInputFormatter.allow('.')
                  //dataInput: formProvider.date,
                  //formProvider: formProvider,
                ),
                const SizedBox(height: 25),
                TextFormFieldCustom(
                  initialValue: cardInfo.description,
                  labelText: 'Descripcion',
                  helperText: 'Breve descripcion del Ingreso o Egreso',
                  cardInfo: cardInfo,
                  suffixIcon: Icons.description,
                  autofocus: true,
                  //inputFormatters: FilteringTextInputFormatter.allow('.')
                  //dataInput: formProvider.description,
                  //formProvider: formProvider,
                ),
                const SizedBox(height: 25),
                TextFormFieldCustom(
                  initialValue: cardInfo.amount > 0
                      ? '${_formatNumber(cardInfo.amount.round())}'
                      : '',
                  labelText: 'Monto',
                  helperText: 'Ingrese Monto',
                  keyboardType: TextInputType.number,
                  cardInfo: cardInfo,
                  suffixIcon: Icons.attach_money_rounded,
                  //inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  // suffixIconColor: Colors.green,
                  //dataInput: formProvider.amount,
                  //formProvider: formProvider,
                ),
                const SizedBox(height: 25),
                if (cardInfo.state == true && cardInfo.amount == 0)
                  RadioListTileCustom(
                    selected: 0,
                    formProvider: formProvider,
                    state: cardInfo.state,
                    cardInfo: cardInfo,
                  ),
                if (cardInfo.state == true && cardInfo.amount > 0)
                  RadioListTileCustom(
                    selected: 1,
                    formProvider: formProvider,
                    state: cardInfo.state,
                    cardInfo: cardInfo,
                  ),
                if (cardInfo.state == false)
                  RadioListTileCustom(
                    selected: 2,
                    formProvider: formProvider,
                    state: cardInfo.state,
                    cardInfo: cardInfo,
                  ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (buttonType == 1) {
                        cardService.createCard(
                          DateProvider.selectedMonth,
                          CardInfo(
                            amount: formProvider.amount,
                            date: formProvider.date,
                            time: formProvider.time,
                            description: formProvider.description,
                            state: formProvider.state,
                          ),
                        );
                      }
                      if (buttonType == 2) {
                        cardService.updateCard(
                          DateProvider.selectedMonth,
                          CardInfo(
                            id: formProvider.id,
                            amount: formProvider.amount,
                            date: formProvider.date,
                            time: formProvider.time,
                            description: formProvider.description,
                            state: formProvider.state,
                          ),
                        );
                      }
                      Navigator.pop(context);
                      // print(
                      //     '---INFORMACION---\n${formProvider.date}\n${formProvider.description}\n${formProvider.amount}\n${formProvider.state}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 104, 104),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fixedSize: const Size(100, 50),
                    ),
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _formatNumber(int value) {
  NumberFormat myFormat = NumberFormat.decimalPattern('es_es');
  return myFormat.format(value);
}
