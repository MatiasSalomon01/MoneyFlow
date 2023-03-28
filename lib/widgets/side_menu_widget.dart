import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:money_flow/preferences/preferences.dart';
import 'package:money_flow/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Drawer(
      child: SlideInLeft(
        duration: const Duration(milliseconds: 350),
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Opciones',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_sharp)),
                //onTap: () => Navigator.pop(context),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(
                    'Pantalla Principal',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Configuración',
                      style: TextStyle(fontSize: 20)),
                  onTap: () => Navigator.popAndPushNamed(context, 'settings'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: const Text('Buscar', style: TextStyle(fontSize: 20)),
                  onTap: () => Navigator.popAndPushNamed(context, 'search'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: ListTile(
                  leading: Preferences.isDarkMode
                      ? const Icon(Icons.dark_mode,
                          color: Color.fromARGB(255, 71, 144, 204), size: 30)
                      : const Icon(Icons.light_mode,
                          color: Color.fromARGB(255, 255, 196, 3), size: 30),
                  title: Preferences.isDarkMode
                      ? const Text('Modo Oscuro',
                          style: TextStyle(fontSize: 20))
                      : const Text('Modo Claro',
                          style: TextStyle(fontSize: 20)),
                  trailing: Switch.adaptive(
                    activeColor: Colors.grey,
                    value: Preferences.isDarkMode,
                    onChanged: (value) {
                      changeTheme(value, themeProvider);
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

changeTheme(dynamic value, ThemeProvider themeProvider) {
  Preferences.isDarkMode = value;
  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
}
