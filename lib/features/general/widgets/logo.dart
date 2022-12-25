// Since the method inside the logo class is technically a widget, lowerCamelCase
// rule for the method name is ignored.
//
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Logo {
  static GradientText GradientLogo({double fontSize = 68}) {
    return GradientText(
      "Hi!re",
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'Barlow', fontSize: fontSize),
      colors: const [
        Color.fromARGB(255, 9, 13, 19),
        Color.fromARGB(255, 74, 102, 120)
      ],
    );
  }

  static Text NormalLogo(
      {TextAlign textAlign = TextAlign.center,
      double fontSize = 20,
      Color color = const Color.fromRGBO(202, 205, 209, 1)}) {
    return Text(
      "Hi!re",
      textAlign: textAlign,
      style: TextStyle(fontFamily: 'Barlow', fontSize: fontSize, color: color),
    );
  }
}
