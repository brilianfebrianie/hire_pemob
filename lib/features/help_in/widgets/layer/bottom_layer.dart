import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class BottomLayer {
  static Column buildBottomLayer(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Image.asset('./assets/images/background/helpin_background.png'),
            SafeArea(child: buildSearchBar()),
          ],
        ),
        SizedBox(
          height: 130,
        ),
        Ink(
          width: MediaQuery.of(context).size.width,
          color: AppColor.secondaryGrey(),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 150, left: 30),
                child: Text(
                  "Take Any Offer!",
                  style: AppTextStyle.header(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  "Find Any Offer Nearby",
                  style: AppTextStyle.header3(fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(
                  './assets/images/placeholder/map_placeholder.png',
                  scale: 1.1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Figure Out Another Offer",
                      style: AppTextStyle.header3(fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See More",
                      style: AppTextStyle.body(
                          fontSize: 15, color: AppColor.primaryBlue()),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  static Container buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondaryGrey(opacity: 1),
      ),
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
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
