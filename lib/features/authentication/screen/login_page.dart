import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/widget/forms/login_form.dart';
import 'package:build_hire_app/features/authentication/widget/general_auth_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: GeneralAuthWidget.AuthPageHeader(context)),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 45),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login Account",
                      style: AppTextStyle.header2(fontSize: 25),
                    ),
                  ),
                  LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController),
                  Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: GeneralAuthWidget.AuthSeparator())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
