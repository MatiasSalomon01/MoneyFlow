import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CardService(),
        ),
        ChangeNotifierProvider(
          create: (context) => FormProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}

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
        //'form': (context) => FormScreen(),
        'settings': (context) => SettingsScreen()
      },
      theme: ThemeApp.darkTheme,
      // theme: ThemeApp.lightTheme,
    );
  }
}
