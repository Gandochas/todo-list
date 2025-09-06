import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/data/tasks_datasource.dart';
import 'package:my_todo_app/data/theme_datasource.dart';
import 'package:my_todo_app/domain/bloc/task/task_bloc.dart';
import 'package:my_todo_app/domain/bloc/theme/theme_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        final preferences = snapshot.data!;
        final taskDatasource = TaskDatasourceImpl(preferences: preferences);
        final themeDatasource = ThemeDatasourceImpl(preferences: preferences);

        return MultiProvider(
          providers: [
            Provider<TaskDatasource>.value(value: taskDatasource),
            Provider<ThemeDatasource>.value(value: themeDatasource),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => TaskBloc(datasource: taskDatasource),
              ),
              BlocProvider(
                create: (_) => ThemeBloc(themeDatasource: themeDatasource),
              ),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
