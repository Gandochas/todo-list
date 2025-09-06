import 'package:flutter/material.dart';
import 'package:my_todo_app/core/themes/theme.dart';
import 'package:my_todo_app/data/tasks_datasource.dart';
import 'package:my_todo_app/data/theme_datasource.dart';
import 'package:my_todo_app/domain/controller/task_controller.dart';
import 'package:my_todo_app/domain/controller/theme_controller.dart';
import 'package:my_todo_app/presentation/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final taskDatasource = TaskDatasourceImpl(preferences: preferences);
  final themeDatasource = ThemeDatasourceImpl(preferences: preferences);

  final taskController = TaskController(datasource: taskDatasource);
  final themeController = ThemeController(themeDatasource: themeDatasource);

  await taskController.load();
  await themeController.load();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => taskController),
        ChangeNotifierProvider(create: (_) => themeController),
      ],
      child: const MyTODOApp(),
    ),
  );
}

class MyTODOApp extends StatelessWidget {
  const MyTODOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDO List App',
          theme: themeController.isDark ? darkMode : lightMode,
          home: const MyHomePage(),
        );
      },
    );
  }
}
