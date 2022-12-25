import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/services/auth_services.dart';
import 'package:build_hire_app/features/authentication/widget/forms/form_widget.dart';
import 'package:build_hire_app/features/general/widgets/button.dart';
import 'package:flutter/material.dart';

class AuthTroublePage extends StatelessWidget {
  AuthTroublePage({Key? key}) : super(key: key);

  final TextEditingController troubleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.lock_outlined,
              size: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Trouble Logging In?",
                style: AppTextStyle.header2(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: const Text(
                "Enter your email and we’ll send you the OTP code to get back into your account.",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: FormWidget().NormalFormFieldWithoutPrefix(
                  troubleController, "Email", (_) {}),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AuthenticationServices.resetPassword(
                            troubleController.text, context);
                      },
                      child: Button.GeneralButton(
                          "Next", AppColor.primaryBlue(),
                          labelColor: Colors.white,
                          verticalPadding: 15,
                          labelStyle: AppTextStyle.header3(
                              color: Colors.white, fontSize: 15)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
