import 'package:build_hire_app/features/help_in/screen/helpin_homepage.dart';
import 'package:build_hire_app/features/help_in/screen/mytask_page.dart';
import 'package:flutter/cupertino.dart';

class HelpInNavbarProvider extends ChangeNotifier {
  List pages = [HelpInHomePage(), const MyTaskPage()];

  int _currentPageIndex = 0;

  Widget get currentPage => pages[_currentPageIndex];

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int newIndex) {
    _currentPageIndex = newIndex;
    notifyListeners();
  }
}
