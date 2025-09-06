import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_todo_app/data/theme_datasource.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required ThemeDatasource themeDatasource})
    : _themeDatasource = themeDatasource,
      super(const ThemeState()) {
    on<ThemeEvent>(
      (event, emit) => event.map(
        loadTheme: (_) => _onThemeLoad(emit),
        toggleTheme: (_) => _onThemeToggle(emit),
      ),
    );
  }

  final ThemeDatasource _themeDatasource;

  Future<void> _onThemeLoad(Emitter<ThemeState> emit) async {
    final isDark = await _themeDatasource.loadTheme();
    emit(state.copyWith(isDark: isDark));
  }

  Future<void> _onThemeToggle(Emitter<ThemeState> emit) async {
    final newValue = !state.isDark;
    unawaited(_themeDatasource.updateTheme(isDark: newValue));
    emit(state.copyWith(isDark: newValue));
  }
}
