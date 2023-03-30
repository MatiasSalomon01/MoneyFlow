import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/providers/theme_provider.dart';
import 'package:money_flow/screens/screens.dart';
import 'package:money_flow/services/services.dart';
import 'package:money_flow/theme/theme.dart';
import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Preferences.init();
//   runApp(AppState());
// }

// class AppState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => CardService(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => FormProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => ModelOptionsProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => AlertProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => DateProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => AmountProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) =>
//               ThemeProvider(isDarkMode: Preferences.isDarkMode),
//         )
//       ],
//       child: MyApp(),
//     );
//   }
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CardService(),
      ),
      ChangeNotifierProvider(
        create: (context) => FormProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ModelOptionsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AlertProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DateProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AmountProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchScreenProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LoginService(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Money Flow',
        initialRoute: 'login',
        routes: {
          'home': (context) => const HomeScreen(),
          'settings': (context) => const SettingsScreen(),
          'search': (context) => const SearchScreen(),
          'login': (context) => const LoginScreen(),
          'register': (context) => const RegisterScreen()
        },
        // theme: ThemeApp.darkTheme,
        theme: Provider.of<ThemeProvider>(context).currentTheme);
  }
}
