import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text(
              '      Opciones',
              style: TextStyle(fontSize: 20),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close_sharp)),
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
              title:
                  const Text('Configuración', style: TextStyle(fontSize: 20)),
              onTap: () => Navigator.popAndPushNamed(context, 'settings'),
            ),
          )
        ],
      ),
    );
  }
}
