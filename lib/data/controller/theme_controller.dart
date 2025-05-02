import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ThemeController with ChangeNotifier {
  ThemeController({required SharedPreferences preferences})
    : _preferences = preferences,
      _isDark = false;

  final SharedPreferences _preferences;

  bool _isDark;
  bool get isDark => _isDark;

  Future<bool> _fetch() async {
    final isDark = _preferences.getBool('is_dark');
    return isDark ?? false;
  }

  Future<void> _update({required bool isDark}) async {
    await _preferences.setBool('is_dark', isDark);
  }

  Future<void> load() async {
    _isDark = await _fetch();
    notifyListeners();
  }

  Future<void> switchTheme({bool? isDark}) async {
    await _update(isDark: isDark ?? !_isDark);
    _isDark = isDark ?? !_isDark;
    notifyListeners();
  }
}
