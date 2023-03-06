import 'package:flutter/material.dart';

class ThemeApp {
  static final mainLightColor = Colors.indigo;

  static final mainDarkColor = Color.fromARGB(255, 69, 69, 69);

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
          unselectedItemColor: Colors.grey));
}
