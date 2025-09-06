import 'package:flutter/material.dart';
import 'package:my_todo_app/app.dart';
import 'package:my_todo_app/core/config/app_configuration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const AppConfiguration(child: TodoApp()),
  );
}
