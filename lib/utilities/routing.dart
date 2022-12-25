import 'package:flutter/material.dart';

class AppRouter {
  // This function will push new pages into the MaterialPageRoute's stack
  //
  // For example :
  // navigateTo(context, MainPage()) will turn the stack from this :
  //
  // |Home Page|
  //
  // to this :
  //
  // |Main Page|
  // |Home Page|
  //
  // Easy Description :
  //
  //
  static void navigateTo(BuildContext context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
