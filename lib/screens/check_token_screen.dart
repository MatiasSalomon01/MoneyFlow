import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/services/services.dart';
import 'package:provider/provider.dart';

class CheckTokenScreen extends StatelessWidget {
  const CheckTokenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<LoginService>(context);
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: loginService.readToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Espere...');
          }
          if (snapshot.data == '') {
            Future.microtask(() {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      LoginScreen(),
                  transitionDuration: Duration(seconds: 0)));
            });
          } else {
            Future.microtask(() {
              // Provider.of<CardService>(context, listen: false)
              //     .loadCards(false, Preferences.id);
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomeScreen(),
                  transitionDuration: Duration(seconds: 0)));
            });
          }
          return Container();
        },
      ),
    ));
  }
}
