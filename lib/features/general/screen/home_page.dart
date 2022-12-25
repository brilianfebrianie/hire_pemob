import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/general/widgets/general_widgets.dart';
import 'package:build_hire_app/features/help_in/screen/helpin_page.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  AppColor.primaryPurple(opacity: 0.7),
                  Colors.white.withOpacity(0.4)
                ])),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    "Hello! Good Evening,",
                    style: AppTextStyle.header(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: Text(
                    FirebaseAuth.instance.currentUser?.displayName
                        ?.split(" ")
                        .first as String,
                    style: AppTextStyle.header(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                GeneralWidgets.buildSearchBar(),
                buildPrimaryCallback(context),
                _buildSeparator(context),
                Container(
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 15, left: 20, right: 20),
                  child: Text(
                    "My Wallet",
                    style: AppTextStyle.header(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildWallet(),
                ),
                _buildSeparator(context),
                Container(
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 20),
                  child: Text(
                    "Find Any Offers",
                    style: AppTextStyle.header(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildCategories(),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Container _buildSeparator(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, AppColor.secondaryGrey(opacity: 0.5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }

  SingleChildScrollView buildWallet() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          buildWalletCard("Balance", "Rp 17.000"),
          buildWalletCard("Top Up", "Wallet"),
          buildWalletCard("Poin", "225 Pts")
        ],
      ),
    );
  }

  SingleChildScrollView buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          buildCategoryCard(
              '/assets/images/placeholder/otomotif_placeholder.png',
              'Otomotif'),
          buildCategoryCard(
              '/assets/images/placeholder/education_placeholder.png',
              'Education'),
          buildCategoryCard(
              '/assets/images/placeholder/service_placeholder.png', 'Services')
        ],
      ),
    );
  }

  Container buildCategoryCard(String imagePath, String label) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: AppColor.secondaryGrey(),
          borderRadius: BorderRadius.circular(10)),
      height: 160,
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('.$imagePath'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              label,
              style: AppTextStyle.header3(fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

  Container buildWalletCard(String cardTitle, String cardValue) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondaryGrey(),
      ),
      height: 60,
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text(
              cardTitle,
              style: AppTextStyle.body(fontSize: 11),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              cardValue,
              style: AppTextStyle.header2(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  InkWell buildPrimaryCallback(BuildContext context) {
    return InkWell(
      onTap: () => AppRouter.navigateTo(context, const HelpInPage()),
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(204, 209, 229, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Create Your Task Now!",
                style: AppTextStyle.header(fontSize: 17),
              ),
            ),
            Image.asset(
              './assets/images/placeholder/homepage_helpin.png',
              scale: 1.2,
            )
          ],
        ),
      ),
    );
  }
}
