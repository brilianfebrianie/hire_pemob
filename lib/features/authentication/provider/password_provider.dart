import 'package:flutter/cupertino.dart';

class PasswordProvider extends ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void switchObscure(_) {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
