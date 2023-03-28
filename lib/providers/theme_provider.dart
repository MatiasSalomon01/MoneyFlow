import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  static final mainLightColor = Color(0xff5090CF);

  static final mainDarkColor = Color.fromARGB(255, 69, 69, 69);

  static Color _selectedElevatedButton = Preferences.isDarkMode
      ? Color.fromARGB(255, 126, 125, 125)
      : Color.fromARGB(255, 190, 223, 255);
  static Color _selectedElevatedButtonSeeAll = Preferences.isDarkMode
      ? Color.fromARGB(255, 128, 46, 46)
      : Color.fromARGB(255, 190, 223, 255);

  bool _x = true;

  static Color _currentColor =
      Preferences.isDarkMode ? mainDarkColor : Color(0xff1E77CF);

  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBarTheme: AppBarTheme(backgroundColor: mainLightColor),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Color(0xff1E77CF)),
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
    _currentColor = Color(0xff1E77CF);
    selectColorDark(
        Color.fromARGB(255, 105, 152, 199), Color.fromARGB(255, 128, 46, 46));
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = darkTheme;
    _x = true;
    _currentColor = mainDarkColor;
    selectColorDark(
        Color.fromARGB(255, 126, 125, 125), Color.fromARGB(255, 128, 46, 46));
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
