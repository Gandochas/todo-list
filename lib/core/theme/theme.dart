import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.purple[100]!,
    primary: Colors.purple[400]!,
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.blueGrey[800]!,
    primary: Colors.blueGrey[400]!,
  ),
);
