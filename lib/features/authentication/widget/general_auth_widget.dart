// ignore_for_file: non_constant_identifier_names

import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:flutter/material.dart';

class GeneralAuthWidget {
  static Row AuthPageHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            AppRouter.back(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        const InkWell(
          child: Icon(
            Icons.help_outline_outlined,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  static Row buildAuthTool(String leftLabel, String rightLabel,
      Function()? leftFunction, Function()? rightFunction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: leftFunction,
          child: Text(
            leftLabel,
            style: AppTextStyle.body(fontSize: 12),
          ),
        ),
        InkWell(
          onTap: rightFunction,
          child: Text(
            rightLabel,
            style: AppTextStyle.body(fontSize: 12),
          ),
        )
      ],
    );
  }

  static Row AuthSeparator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 2,
          width: 50,
          color: AppColor.primaryGrey(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            "Or",
            style: TextStyle(fontSize: 13),
          ),
        ),
        Container(
          height: 2,
          width: 50,
          color: AppColor.primaryGrey(),
        ),
      ],
    );
  }
}
