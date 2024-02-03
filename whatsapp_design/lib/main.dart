import 'package:flutter/material.dart';
import 'package:whatsapp_design/presentation/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Responsive Design',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(colorSchemeSeed: Colors.green),
      darkTheme:
          ThemeData(colorSchemeSeed: Colors.green, brightness: Brightness.dark),
      themeMode: ThemeMode.system,
    );
  }
}
