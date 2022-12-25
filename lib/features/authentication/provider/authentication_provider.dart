import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/features/authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginValidator extends ChangeNotifier {
  bool _isValid = false;

  bool get isValid => _isValid;

  set isValid(bool newValue) {
    _isValid = newValue;
    notifyListeners();
  }

  void validate(String email, String password) {
    if (email.contains('@')) {
      if (password.length >= 8) {
        isValid = true;
      } else {
        isValid = false;
      }
    } else {
      isValid = false;
    }
  }

  Color get buttonColor =>
      (isValid) ? AppColor.primaryBlue() : AppColor.primaryBlue(opacity: 0.5);

  void response(BuildContext context, String email, String password) {
    if (_isValid) {
      AuthenticationServices.login(email, password, context);

      if (kDebugMode) {
        print(FirebaseAuth.instance.currentUser?.displayName);
      }
    }
  }
}

class RegisterValidator extends ChangeNotifier {
  bool _isValid = false;

  bool get isValid => _isValid;

  set isValid(bool newValue) {
    _isValid = newValue;
    notifyListeners();
  }

  void validate(
      String name, String email, String phoneNumber, String password) {
    if (name.isNotEmpty) {
      if (email.contains('@')) {
        if (phoneNumber.length >= 8) {
          if (password.length >= 8) {
            isValid = true;
          } else {
            isValid = false;
          }
        } else {
          isValid = false;
        }
      } else {
        isValid = false;
      }
    }
  }

  Color get buttonColor =>
      (isValid) ? AppColor.primaryBlue() : AppColor.primaryBlue(opacity: 0.5);

  void response(BuildContext context, String name, String email,
      String phoneNumber, String password) {
    if (isValid) {
      AuthenticationServices.register(
          name, email, phoneNumber, password, context);
    }
  }
}
