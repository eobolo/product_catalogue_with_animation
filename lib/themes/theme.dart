import 'package:flutter/material.dart';

class AppThemes {
  // Define the primary color
  static const primaryColor = Colors.blue;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
  );
}
