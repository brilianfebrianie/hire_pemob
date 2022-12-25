import 'package:build_hire_app/features/help_in/provider/helpin_navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpInPage extends StatelessWidget {
  const HelpInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HelpInNavbarProvider>(
      create: (context) => HelpInNavbarProvider(),
      child: Scaffold(
        body: Consumer<HelpInNavbarProvider>(
            builder: (context, provider, _) => provider.currentPage),
        bottomNavigationBar: Consumer<HelpInNavbarProvider>(
            builder: (context, provider, _) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () => provider.currentPageIndex = 0,
                        child: Icon(provider.currentPageIndex == 0
                            ? Icons.work
                            : Icons.work_outline),
                      ),
                      InkWell(
                        onTap: () => provider.currentPageIndex = 1,
                        child: Icon(provider.currentPageIndex == 1
                            ? Icons.my_library_books
                            : Icons.my_library_books_outlined),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
