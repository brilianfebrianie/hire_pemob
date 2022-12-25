import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/screen/login_page.dart';
import 'package:build_hire_app/features/authentication/screen/register_page.dart';
import 'package:build_hire_app/features/general/widgets/button.dart';
import 'package:build_hire_app/features/general/widgets/carousel.dart';
import 'package:build_hire_app/features/general/widgets/logo.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 73, 63, 96),
            Color.fromARGB(255, 61, 90, 116)
          ])),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 5),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Logo.NormalLogo(fontSize: 40),
                Container(
                  width: 230,
                  margin: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Let's get you inside the app!",
                    textAlign: TextAlign.start,
                    style:
                        AppTextStyle.header(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 420,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Carousel(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            AppRouter.navigateTo(context, const RegisterPage());
                          },
                          child: Button.GeneralButton(
                              "Register", Colors.white.withOpacity(0.3),
                              verticalPadding: 15,
                              horizontalPadding: 0,
                              labelStyle: AppTextStyle.body(
                                  fontSize: 12, color: Colors.white)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            AppRouter.navigateTo(context, LoginPage());
                          },
                          child: Button.GeneralButton(
                              "Login", Colors.white.withOpacity(0.3),
                              verticalPadding: 15,
                              horizontalPadding: 0,
                              labelStyle: AppTextStyle.body(
                                  fontSize: 12, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
