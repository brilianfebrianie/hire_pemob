import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/provider/authentication_provider.dart';
import 'package:build_hire_app/features/authentication/screen/register_page.dart';
import 'package:build_hire_app/features/authentication/screen/trouble_page.dart';
import 'package:build_hire_app/features/authentication/widget/forms/form_widget.dart';
import 'package:build_hire_app/features/authentication/widget/general_auth_widget.dart';
import 'package:build_hire_app/features/general/widgets/button.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginValidator>(
      create: (context) => LoginValidator(),
      child: Form(
          child: Column(
        children: <Widget>[
          Consumer<LoginValidator>(
            builder: (context, validator, _) => FormWidget().NormalFormField(
                _emailController,
                "Email or phone number",
                Icons.person_outlined,
                (String string) => validator.validate(
                    _emailController.text, _passwordController.text)),
          ),
          Consumer<LoginValidator>(
            builder: (context, validator, child) => Container(
              margin: const EdgeInsets.only(top: 15),
              child: FormWidget().PasswordFormField(
                _passwordController,
                "Password",
                Icons.shield,
                (String string) => validator.validate(
                    _emailController.text, _passwordController.text),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 40),
              child: GeneralAuthWidget.buildAuthTool(
                  "Register",
                  "Forgot Password?",
                  () => AppRouter.navigateTo(context, const RegisterPage()),
                  () => AppRouter.navigateTo(context, AuthTroublePage()))),
          Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Consumer<LoginValidator>(
                  builder: (context, validator, _) => InkWell(
                      onTap: () => validator.response(context,
                          _emailController.text, _passwordController.text),
                      child: Button.GeneralButton(
                          "Login", validator.buttonColor,
                          labelStyle: AppTextStyle.header3(
                              fontSize: 13, color: Colors.white),
                          labelColor: Colors.white,
                          verticalPadding: 12))),
            ),
          ])
        ],
      )),
    );
  }
}
