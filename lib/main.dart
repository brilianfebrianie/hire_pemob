import 'package:build_hire_app/features/authentication/screen/login_page.dart';
import 'package:build_hire_app/features/general/screen/main_page.dart';
import 'package:build_hire_app/features/general/screen/welcome_page.dart';
import 'package:build_hire_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  //FUNCTION NAME : isFirstTime()
  //DESCRIPTION :
  //  This function will return the user first time status
  //
  //  Example :
  //    When a user just downloaded the app and it's their first time opening it,
  //    this function will return true
  //
  //  Another Example :
  //    When a user has already passed the welcome page, this function will return false
  Future<bool> isFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool("isFirstTime") ?? true;
  }

  //FUNCTION NAME : isLoggedIn()
  //DESCRIPTION :
  //  This function will return the status logged in status
  //
  //  Example :
  //    When a user has already logged in to the app and haven't logged out, this function
  //    will return true
  //
  //  Another Example :
  //    When a user isn't logged in or have logged in but decided to log out, this function
  //    will return false
  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool("isLoggedIn") ?? false;
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //The default font is Montserrat
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: _buildFirstPage(),
    );
  }

  //FUNCTION NAME : _buildFirstPage()
  //DESCRIPTION :
  //  This function will build the folllowing pages:
  //
  //  User Condition : New to the application
  //  Will Build : Welcome Page
  //
  //  User Condition : Not new to the application, haven't logged in
  //  Will Build : Login Page
  //
  //  User Condition : Have already logged in, didn't logout
  //  Will Build : Main Page
  FutureBuilder<bool> _buildFirstPage() {
    return FutureBuilder<bool>(
      future: isFirstTime(),
      builder: ((context, snapshot) {
        if (snapshot.data == true) {
          return const WelcomePage();
        } else {
          return FutureBuilder<bool>(
              future: isLoggedIn(),
              builder: ((context, snapshot) {
                if (snapshot.data == true) {
                  return const MainPage();
                } else {
                  return LoginPage();
                }
              }));
        }
      }),
    );
  }
}
