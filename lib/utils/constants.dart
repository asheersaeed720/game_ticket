import 'package:flutter/material.dart';

const primaryColor = Color(0xFF47BB84);

//? Light Theme
const Color textColor1 = Color(0XFFA7BCC7);
const Color textFieldColor = Color.fromARGB(255, 238, 236, 237);

//? TextStyle
TextStyle kTitleStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontSize: 18.0,
);
TextStyle kBodyStyle = const TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
