import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class GeneralWidgets {
  static Container buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: InkWell(
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.secondaryGrey(opacity: 0.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: <Widget>[
              const Icon(Icons.search),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  "Search service you need or any help",
                  style: AppTextStyle.body(
                      fontSize: 9, color: Colors.black.withOpacity(0.5)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
