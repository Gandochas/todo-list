import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/core/themes/theme.dart';
import 'package:my_todo_app/domain/bloc/task/task_bloc.dart';
import 'package:my_todo_app/domain/bloc/theme/theme_bloc.dart';
import 'package:my_todo_app/presentation/pages/home.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskBloc>().add(const TaskEvent.loadTasks());
    context.read<ThemeBloc>().add(const ThemeEvent.loadTheme());

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDO List App',
          theme: state.isDark ? darkMode : lightMode,
          home: const MyHomePage(),
        );
      },
    );
  }
}
