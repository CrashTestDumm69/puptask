import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData get midnightTheme => ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
    cardColor: Colors.black,
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.grey,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
  );

  static ThemeData get lightTheme => ThemeData.light(useMaterial3: true);

  static ThemeData get darkTheme => ThemeData.dark(useMaterial3: true);
}