import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/general/screen/onboarding_page.dart';
import 'package:build_hire_app/features/general/widgets/button.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                'assets/images/placeholder/notification_placeholder.png'),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                "Stay up to date by turning on your notification",
                textAlign: TextAlign.center,
                style: AppTextStyle.header(fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Get any information, offers, and service updates.',
                style: AppTextStyle.body(fontSize: 10),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: InkWell(
                  onTap: () {
                    Permission.notification.request().then((value) =>
                        AppRouter.navigateTo(context, const OnboardingPage()));
                  },
                  child:
                      Button.GeneralButton("Allow", AppColor.secondaryGrey())),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  Permission.notification.request().then((value) =>
                      AppRouter.navigateTo(context, const OnboardingPage()));
                },
                child: Button.GeneralButton("Deny", Colors.transparent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
