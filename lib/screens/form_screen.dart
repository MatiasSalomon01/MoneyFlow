import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_flow/widgets/widgets.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    initialValue:
                        DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    labelText: 'Fecha',
                    helperText: 'Fecha de ocurrencia'),
                const SizedBox(height: 25),
                const TextFormFieldCustom(
                    initialValue: null,
                    labelText: 'Descripcion',
                    helperText: 'Breve descripcion del Ingreso o Egreso'),
                const SizedBox(height: 25),
                const TextFormFieldCustom(
                  labelText: 'Monto',
                  helperText: 'Ingrese Monto',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 25),
                const RadioListTileCustom(selected: 1),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
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
