import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configuración'),
      ),
      // body: Center(
      //   child: SwitchListTile.adaptive(
      //     value: Preferences.isDarkMode,
      //     title: const Text('Darkmode'),
      //     onChanged: (value) {
      //       Preferences.isDarkMode = value;
      //       final themeProvider =
      //           Provider.of<ThemeProvider>(context, listen: false);
      //       value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
      //       setState(() {});
      //     },
      //   ),
      // ),
    );
  }
}
