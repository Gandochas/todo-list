import 'package:flutter/material.dart';
import 'package:my_todo_app/core/theme/theme.dart';
import 'package:my_todo_app/main.dart';
import 'package:my_todo_app/presentation/screens/home.dart';

class App extends StatefulWidget {
  const App({required this.dependencies, super.key});

  final Dependencies dependencies;

  static Dependencies dependenciesOf(BuildContext context) =>
      context.findAncestorWidgetOfExactType<App>()!.dependencies;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    widget.dependencies.themeController.addListener(_switchTheme);
  }

  @override
  void dispose() {
    widget.dependencies.themeController.removeListener(_switchTheme);
    super.dispose();
  }

  void _switchTheme() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDO List App',
      theme: widget.dependencies.themeController.isDark ? darkMode : lightMode,
      home: const MyHomePage(),
    );
  }
}
