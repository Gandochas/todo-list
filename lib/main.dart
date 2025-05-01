import 'package:flutter/material.dart';
import 'package:my_todo_app/pages/home.dart';
import 'package:my_todo_app/themes/mytheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyTODOApp());
}

class MyTODOApp extends StatefulWidget {
  const MyTODOApp({super.key});

  @override
  State<MyTODOApp> createState() => _MyTODOAppState();
}

class _MyTODOAppState extends State<MyTODOApp> {
  bool _isDarkTheme = false;

  void _switchTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDO List App',
      theme: _isDarkTheme ? darkMode : lightMode,
      home: MyHomePage(
        isDarkTheme: _isDarkTheme,
        switchTheme: _switchTheme,
      ),
    );
  }
}
