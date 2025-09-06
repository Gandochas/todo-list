import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/core/themes/theme.dart';
import 'package:my_todo_app/data/tasks_datasource.dart';
import 'package:my_todo_app/data/theme_datasource.dart';
import 'package:my_todo_app/domain/bloc/task/task_bloc.dart';
import 'package:my_todo_app/domain/bloc/theme/theme_bloc.dart';
import 'package:my_todo_app/presentation/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final taskDatasource = TaskDatasourceImpl(preferences: preferences);
  final themeDatasource = ThemeDatasourceImpl(preferences: preferences);

  final taskBloc = TaskBloc(datasource: taskDatasource);
  final themeBloc = ThemeBloc(themeDatasource: themeDatasource);

  // Initialize blocs
  taskBloc.add(const TaskEvent.loadTasks());
  themeBloc.add(const ThemeEvent.loadTheme());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => taskBloc),
        BlocProvider(create: (_) => themeBloc),
      ],
      child: const MyTODOApp(),
    ),
  );
}

class MyTODOApp extends StatelessWidget {
  const MyTODOApp({super.key});

  @override
  Widget build(BuildContext context) {
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
