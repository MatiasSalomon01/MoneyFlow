import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Flow',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Flow'),
        ),
        body: const Center(
          child: Text('Money Flow'),
        ),
      ),
    );
  }
}