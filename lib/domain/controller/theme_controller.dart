import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:my_todo_app/data/theme_datasource.dart';

final class ThemeController with ChangeNotifier {
  ThemeController({required ThemeDatasource themeDatasource}) : _themeDatasource = themeDatasource, _isDark = false;

  final ThemeDatasource _themeDatasource;

  bool _isDark;
  bool get isDark => _isDark;

  Future<void> switchTheme() async {
    _isDark = !_isDark;
    unawaited(_themeDatasource.updateTheme(isDark: _isDark));
    notifyListeners();
  }

  Future<void> load() async {
    _isDark = await _themeDatasource.loadTheme();
    notifyListeners();
  }
}
