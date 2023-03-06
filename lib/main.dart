import 'package:flutter/material.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Flow',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'form': (context) => FormScreen()
      },
      theme: ThemeApp.darkTheme,
      // theme: ThemeApp.lightTheme,
    );
  }
}
