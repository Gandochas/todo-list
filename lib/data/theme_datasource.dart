import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ThemeDatasource {
  Future<bool> loadTheme();
  Future<void> updateTheme({required bool isDark});
}

base class ThemeDatasourceImpl implements ThemeDatasource {
  ThemeDatasourceImpl({required SharedPreferences preferences}) : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  Future<bool> loadTheme() async {
    final isDark = _preferences.getBool('is_dark');

    return isDark ?? false;
  }

  @override
  Future<void> updateTheme({required bool isDark}) async {
    await _preferences.setBool('is_dark', isDark);
  }
}
