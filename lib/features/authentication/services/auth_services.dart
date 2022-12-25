import 'package:build_hire_app/databases/firebase_database/user_database.dart';
import 'package:build_hire_app/features/authentication/screen/login_page.dart';
import 'package:build_hire_app/features/authentication/widget/pop_up.dart';
import 'package:build_hire_app/features/general/screen/main_page.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authentication {
  static register(
      String name, String email, String phoneNumber, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserDatabase.register(name, email, phoneNumber);
  }

  static void login(String email, String password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static resetPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

class AuthenticationServices extends Authentication {
  static register(String name, String email, String phoneNumber,
      String password, BuildContext context) async {
    try {
      await Authentication.register(name, email, phoneNumber, password);

      FirebaseAuth.instance.currentUser?.updateDisplayName(name);

      FirebaseAuth.instance.currentUser?.sendEmailVerification();

      showDialog(
          context: context,
          builder: (BuildContext context) => PopUpDialog(
                contentTitle: "Email sent",
                contentBody: "We have sent a verification link to $email",
                function: () => AppRouter.navigateTo(context, LoginPage()),
              ));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static void login(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      AppRouter.navigateTo(context, const MainPage());

      if (kDebugMode) {}
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static void resetPassword(String email, BuildContext context) async {
    try {
      await Authentication.resetPassword(email);

      showDialog(
          context: context,
          builder: (BuildContext buildContext) => PopUpDialog(
              contentTitle: "Email Sent",
              contentBody: "We have sent an email to $email",
              function: () => AppRouter.navigateTo(context, LoginPage())));
    } catch (e) {}
  }
}
