import 'package:flutter/material.dart';

//This is where we declare the text style of the app

class AppTextStyle {
  static TextStyle header(
      {String fontFamily = 'Montserrat',
      double fontSize = 25,
      Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w800);
  }

  static TextStyle header2(
      {String fontFamily = 'Montserrat',
      double fontSize = 25,
      Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700);
  }

  static TextStyle header3(
      {String fontFamily = 'Montserrat',
      double fontSize = 25,
      Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w600);
  }

  static TextStyle body(
      {String fontFamily = 'Montserrat',
      double fontSize = 11,
      Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w500);
  }
}
