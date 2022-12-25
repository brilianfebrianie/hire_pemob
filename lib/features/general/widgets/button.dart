// ignore_for_file: non_constant_identifier_names

import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:flutter/material.dart';

//CLASS USAGE :
//Wrap the method below with Inkwell to create a functional button

class Button {
  static Ink GeneralButton(String buttonLabel, Color buttonColor,
      {double horizontalPadding = 100,
      double verticalPadding = 10,
      Color labelColor = Colors.black,
      double fontSize = 12,
      TextStyle? labelStyle,
      double? width,
      double? height}) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Text(
        buttonLabel,
        textAlign: TextAlign.center,
        style: labelStyle ??
            AppTextStyle.header3(fontSize: fontSize, color: labelColor),
      ),
    );
  }
}
