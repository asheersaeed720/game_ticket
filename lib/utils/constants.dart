import 'package:flutter/material.dart';

const primaryColor = Color(0xFF47BB84);

//? Light Theme
const Color textColor1 = Color(0XFFA7BCC7);
const Color textFieldColor = Color.fromARGB(255, 238, 236, 237);

//? TextStyle
TextStyle kTitleStyle = const TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
