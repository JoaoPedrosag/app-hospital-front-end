import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();

  static const MaterialColor _primarySwatch = MaterialColor(0XFF0066B0, {
    50: Color(0XFF0066B0),
    100: Color(0XFF00528d),
    200: Color(0XFF00477b),
    300: Color(0XFF003d6a),
    400: Color(0XFF003358),
    500: Color(0XFF002946),
    600: Color(0XFF001f35),
    700: Color(0XFF001423),
    800: Color(0XFF000a12),
    900: Color(0XFF000000),
  });
  static final ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color.fromARGB(250, 26, 35, 126),
    primaryColorLight: const Color.fromARGB(238, 39, 64, 155),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
