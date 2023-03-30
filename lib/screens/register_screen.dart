import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 65, 65, 65),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: const [
                  _Title(),
                  SizedBox(height: 20),
                  _InputEmail(),
                  SizedBox(height: 30),
                  _InputPassword(),
                  _RegisterButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Crear Usuario', style: TextStyle(fontSize: 25));
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        floatingLabelStyle: TextStyle(
          color: Preferences.isDarkMode ? Colors.white : Colors.black,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.visibility_off),
      ),
    );
  }
}

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelStyle: TextStyle(
          color: Preferences.isDarkMode ? Colors.white : Colors.black,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 48, 48, 48),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: const Center(
        child: Text(
          'Registrar',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
