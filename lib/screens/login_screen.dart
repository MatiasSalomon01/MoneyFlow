import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
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
                _LogInButton()
              ],
            ),
          ),
          TextButton(
              onPressed: () async {
                Navigator.pushNamed(context, 'register');

                final userService =
                    await Provider.of<UserService>(context, listen: false)
                        .loadUsers();

                // userService.forEach((element) {
                //   print("${element.id} ${element.email}");
                // });
              },
              child: Text(
                'Crear Usuario',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        ],
      ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Iniciar Sesión', style: TextStyle(fontSize: 25));
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
      onChanged: (value) => authProvider.password = value,
    );
  }
}

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    List<String> emails = ["m@m.com", "matias@.gmail.com"];
    // return InputDecorator(
    //   decoration: InputDecoration(
    //     // labelText: 'Email',
    //     contentPadding: EdgeInsets.all(0),
    //     floatingLabelStyle: TextStyle(
    //       color: Preferences.isDarkMode ? Colors.white : Colors.black,
    //     ),
    //     focusedBorder: const OutlineInputBorder(
    //       borderSide: BorderSide(color: Colors.grey, width: 2),
    //       borderRadius: BorderRadius.all(Radius.circular(50)),
    //     ),
    //     border: const OutlineInputBorder(),
    //     suffixIcon: const Icon(Icons.email_outlined),
    //   ),
    //   child: Autocomplete<String>(

    //     optionsBuilder: (textEditingValue) {
    //       if (textEditingValue.text == '') {
    //         return const Iterable.empty();
    //       } else {
    //         return emails.where(
    //           (user) {
    //             return user.contains(textEditingValue.text.toLowerCase());
    //           },
    //         );
    //       }
    //     },
    //     onSelected: (option) {},
    //   ),
    // );
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
      onChanged: (value) => authProvider.email = value,
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final cardService = Provider.of<CardService>(context);
    return GestureDetector(
      onTap: () async {
        final loginService = Provider.of<LoginService>(context, listen: false);
        final userService = Provider.of<UserService>(context, listen: false);
        var x = await userService.getMapUsers();
        final String? errorMessage =
            await loginService.login(authProvider.email, authProvider.password);

        if (errorMessage == null) {
          for (var user in x) {
            if (user['email'] == authProvider.email) {
              userService.userLogged = {
                "email": user['email'],
                "id": user['id']
              };
              Preferences.id = userService.userLogged['id']!;
              Preferences.currentUser = userService.userLogged['email']!;
            } /* else {
              print('user no encontrado');
            }*/
          }
          cardService.cards = [];
          authProvider.email = '';
          authProvider.password = '';
          Navigator.popAndPushNamed(context, 'home');
        } else {
          print(errorMessage);
        }
      },
      child: Container(
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
            'Ingresar',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

// class _Header extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     paint.color = Color.fromARGB(255, 65, 65, 65);
//     paint.style = PaintingStyle.fill;
//     paint.strokeWidth = 5;

//     final path = Path();

//     path.moveTo(0, size.height * 0.2);
//     path.lineTo(0, size.height * 0.8);
//     // path.lineTo(size.width * 0.5, size.height * 0.5);
//     path.quadraticBezierTo(
//         size.width * 0.9, size.height * 0.5, 0, size.height * 0.2);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
