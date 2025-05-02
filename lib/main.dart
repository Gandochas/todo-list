import 'package:flutter/material.dart';
import 'package:my_todo_app/data/controller/task_controller.dart';
import 'package:my_todo_app/data/controller/theme_controller.dart';
import 'package:my_todo_app/presentation/screens/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final taskController = TaskController(preferences: preferences);
  final themeController = ThemeController(preferences: preferences);

  final dependencies = Dependencies(taskController: taskController, themeController: themeController);

  await taskController.load();
  await themeController.load();

  runApp(App(dependencies: dependencies));
}

final class Dependencies {
  const Dependencies({required this.taskController, required this.themeController});

  final TaskController taskController;
  final ThemeController themeController;
}
