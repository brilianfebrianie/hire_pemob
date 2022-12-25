import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/widget/forms/register_form.dart';
import 'package:build_hire_app/features/authentication/widget/general_auth_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: GeneralAuthWidget.AuthPageHeader(context)),
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 30),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create Account",
                    style: AppTextStyle.header(),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: RegisterForm(),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: GeneralAuthWidget.AuthSeparator()),
              ],
            ),
          )),
    );
  }
}
