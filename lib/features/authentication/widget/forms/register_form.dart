import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/provider/authentication_provider.dart';
import 'package:build_hire_app/features/authentication/widget/forms/form_widget.dart';
import 'package:build_hire_app/features/general/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterValidator>(
      create: (context) => RegisterValidator(),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Consumer<RegisterValidator>(
            builder: (context, validator, _) => Column(
              children: [
                FormWidget().NormalFormFieldWithoutPrefix(
                    nameController,
                    "Full Name",
                    (String string) => validator.validate(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        passswordController.text)),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Use your real name according to your identity',
                    style: AppTextStyle.body(
                        color: AppColor.primaryBlue(), fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Consumer<RegisterValidator>(
            builder: (context, validator, _) => FormWidget()
                .NormalFormFieldWithoutPrefix(
                    emailController,
                    "Email",
                    (String string) => validator.validate(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        passswordController.text)),
          ),
          Consumer<RegisterValidator>(
            builder: (context, validator, _) => FormWidget()
                .NormalFormFieldWithoutPrefix(
                    phoneController,
                    "Phone Number",
                    (String string) => validator.validate(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        passswordController.text)),
          ),
          Consumer<RegisterValidator>(
            builder: (context, validator, _) => Column(
              children: [
                FormWidget().PasswordFormFieldWithoutPrefix(
                    passswordController,
                    "Password",
                    (String string) => validator.validate(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        passswordController.text)),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Your password must be minimal 8 digits that contain letter words, regular words, and number.',
                    style: AppTextStyle.body(
                        color: AppColor.primaryBlue(), fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Consumer<RegisterValidator>(
              builder: (context, validator, _) =>
                  Flex(direction: Axis.horizontal, children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => validator.response(
                            context,
                            nameController.text,
                            emailController.text,
                            phoneController.text,
                            passswordController.text),
                        child: Button.GeneralButton(
                            "Register", validator.buttonColor,
                            labelColor: Colors.white, verticalPadding: 13),
                      ),
                    ),
                  ]))
        ],
      )),
    );
  }
}
