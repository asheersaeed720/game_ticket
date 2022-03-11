import 'package:flutter/material.dart';
import 'package:game_ticket/utils/constants.dart';

final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(fillColor: textFieldColor, filled: true),
  errorColor: Colors.red[800],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Poppins',
  // textTheme: textTheme,
);

// final darkThemeData = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: primaryColor,
//   scaffoldBackgroundColor: const Color(0xFFECF3F9),
//   errorColor: Colors.red[800],
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   fontFamily: 'Poppins',
//   // textTheme: textTheme,
// );
