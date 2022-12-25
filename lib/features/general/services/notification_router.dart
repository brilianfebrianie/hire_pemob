import 'package:build_hire_app/features/general/screen/onboarding_page.dart';
import 'package:build_hire_app/features/general/screen/permission_page.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationRouter {
  // This function will check whether the user's phone has allowed the app to
  // send a notification with the "permission_handler".
  //
  // If notification permission is granted, navigate to Onboarding Page
  // If notification permission is denied or unknown, navigate to Permission Page
  static void navigate(BuildContext context) async {
    if (await Permission.notification.isGranted) {
      AppRouter.navigateTo(context, const OnboardingPage());
    } else if (await Permission.notification.isDenied) {
      AppRouter.navigateTo(context, const PermissionPage());
    }
  }
}
