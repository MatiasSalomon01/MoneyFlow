import 'package:flutter/material.dart';
import 'package:money_flow/models/models.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final CardInfo cardInfo;

  const FormScreen({super.key, required this.cardInfo});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormFieldCustom(
                  initialValue: cardInfo.date,
                  labelText: 'Fecha',
                  helperText: 'Fecha de ocurrencia',
                  dataInput: formProvider.date,
                  formProvider: formProvider,
                ),
                const SizedBox(height: 25),
                TextFormFieldCustom(
                  initialValue: cardInfo.description,
                  labelText: 'Descripcion',
                  helperText: 'Breve descripcion del Ingreso o Egreso',
                  dataInput: formProvider.description,
                  formProvider: formProvider,
                ),
                const SizedBox(height: 25),
                TextFormFieldCustom(
                  initialValue:
                      cardInfo.amount > 0 ? '${cardInfo.amount.round()}' : '',
                  labelText: 'Monto',
                  helperText: 'Ingrese Monto',
                  keyboardType: TextInputType.number,
                  dataInput: formProvider.amount,
                  formProvider: formProvider,
                ),
                const SizedBox(height: 25),
                if (cardInfo.state == true && cardInfo.amount == 0)
                  RadioListTileCustom(selected: 0, formProvider: formProvider),
                if (cardInfo.state == true && cardInfo.amount > 0)
                  RadioListTileCustom(selected: 1, formProvider: formProvider),
                if (cardInfo.state == false)
                  RadioListTileCustom(selected: 2, formProvider: formProvider),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      print(
                          '---INFORMACION---\n${formProvider.date}\n${formProvider.description}\n${formProvider.amount}\n${formProvider.state}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 104, 104),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fixedSize: const Size(100, 50),
                    ),
                    child: const Text('Agregar'),
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
