import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  static final mainLightColor = Colors.indigo;

  static final mainDarkColor = Color.fromARGB(255, 69, 69, 69);

  bool _x = true;

  static late Color _currentColor = mainDarkColor;

  static ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(backgroundColor: mainLightColor),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: mainLightColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: mainLightColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: mainDarkColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 104, 104, 104)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: mainDarkColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
      ),
    ),
  );

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? darkTheme : lightTheme;

  setLightMode() {
    currentTheme = lightTheme;
    _x = false;
    _currentColor = mainLightColor;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = darkTheme;
    _x = true;
    _currentColor = mainDarkColor;
    notifyListeners();
  }

  Color get currentColor => _currentColor;
}
