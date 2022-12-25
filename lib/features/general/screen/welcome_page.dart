import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/features/general/services/notification_router.dart';
import 'package:build_hire_app/features/general/widgets/button.dart';
import 'package:build_hire_app/features/general/widgets/logo.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo.GradientLogo(),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                "Welcome To Hi!re !",
                style: AppTextStyle.header(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                'Find a job or get any help from others. We also provide education about world of work that you can learn. Get your experience with Hi!re and feel the future for more confidently. ',
                textAlign: TextAlign.center,
                style: AppTextStyle.body(fontSize: 10),
              ),
            ),
            buildTermsOfUse(),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: InkWell(
                onTap: () {
                  NotificationRouter.navigate(context);
                },
                child:
                    Button.GeneralButton("Continue", AppColor.secondaryGrey()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildTermsOfUse() {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: Text(
              "By clicking continue, you agree to",
              style: AppTextStyle.body(fontSize: 9),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 2),
                child: Text(
                  "our",
                  style: AppTextStyle.body(fontSize: 9),
                ),
              ),
              InkWell(
                child: Text(
                  "Terms of Use",
                  style: AppTextStyle.body(color: Colors.blue, fontSize: 9),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
