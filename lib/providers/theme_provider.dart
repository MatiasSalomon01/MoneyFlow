import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  static const mainLightColor = Color(0xff5090CF);

  static const mainDarkColor = Color.fromARGB(255, 69, 69, 69);

  static Color _selectedElevatedButton = Preferences.isDarkMode
      ? const Color.fromARGB(255, 126, 125, 125)
      : const Color.fromARGB(255, 190, 223, 255);
  static Color _selectedElevatedButtonSeeAll = Preferences.isDarkMode
      ? const Color.fromARGB(255, 128, 46, 46)
      : const Color.fromARGB(255, 190, 223, 255);

  static Color _currentColor =
      Preferences.isDarkMode ? mainDarkColor : const Color(0xff1E77CF);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
    appBarTheme: const AppBarTheme(backgroundColor: mainLightColor),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xff1E77CF)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: mainLightColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: mainDarkColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 104, 104, 104),
        foregroundColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: mainDarkColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    ),
  );

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? darkTheme : lightTheme;

  setLightMode() {
    currentTheme = lightTheme;
    _currentColor = const Color(0xff1E77CF);
    selectColorDark(const Color.fromARGB(255, 105, 152, 199),
        const Color.fromARGB(255, 190, 223, 255));
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = darkTheme;
    _currentColor = mainDarkColor;
    selectColorDark(const Color.fromARGB(255, 126, 125, 125),
        const Color.fromARGB(255, 128, 46, 46));
    notifyListeners();
  }

  Color get currentColor => _currentColor;

  Color get selectedElevatedButton => _selectedElevatedButton;

  void selectColorDark(Color value1, Color value2) {
    // _selectedElevatedButton = Color.fromARGB(255, 126, 125, 125);
    // _selectedElevatedButtonSeeAll = Color.fromARGB(255, 128, 46, 46);
    _selectedElevatedButton = value1;
    _selectedElevatedButtonSeeAll = value2;
    notifyListeners();
  }

  Color get selectedElevatedButtonSeeAll => _selectedElevatedButtonSeeAll;
}
