import 'package:flutter/cupertino.dart';

//This is where we declare the color of the app

class AppColor {
  static Color primaryBlue({double opacity = 1}) {
    return Color.fromRGBO(46, 117, 211, opacity);
  }

  static Color secondaryBlue({double opacity = 1}) {
    return Color.fromRGBO(64, 139, 238, opacity);
  }

  static Color accentBlue({double opacity = 1}) {
    return Color.fromRGBO(25, 118, 210, opacity);
  }

  static Color primaryGrey({double opacity = 1}) {
    return Color.fromRGBO(217, 217, 217, opacity);
  }

  static Color secondaryGrey({double opacity = 1}) {
    return Color.fromRGBO(224, 224, 224, opacity);
  }

  static Color successColor({double opacity = 1}) {
    return Color.fromRGBO(76, 175, 80, opacity);
  }

  static Color blueGrey({double opacity = 1}) {
    return Color.fromRGBO(125, 150, 184, opacity);
  }

  static Color primaryGreen({double opacity = 1}) {
    return Color.fromRGBO(0, 123, 132, opacity);
  }

  static Color primaryPurple({double opacity = 1}) {
    return Color.fromRGBO(77, 86, 125, opacity);
  }
}
