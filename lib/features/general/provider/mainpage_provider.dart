import 'package:build_hire_app/features/authentication/screen/account_page.dart';
import 'package:build_hire_app/features/general/screen/home_page.dart';
import 'package:build_hire_app/features/help_in/screen/history_page.dart';
import 'package:flutter/cupertino.dart';

class MainPageProvider extends ChangeNotifier {
  int _currentPageIndex = 0;

  final List _pages = [
    const HomePage(),
    const HelpInHistoryPage(),
    AccountPage()
  ];

  Widget get currentPage => _pages[_currentPageIndex];

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int newIndex) {
    _currentPageIndex = newIndex;
    notifyListeners();
  }
}
