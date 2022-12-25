import 'package:build_hire_app/features/general/provider/mainpage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: ChangeNotifierProvider<MainPageProvider>(
          create: (context) => MainPageProvider(),
          child: Consumer<MainPageProvider>(
            builder: (context, provider, _) => Scaffold(
              body: provider.currentPage,
              bottomNavigationBar: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () => provider.currentPageIndex = 0,
                      child: Icon(
                        provider.currentPageIndex == 0
                            ? Icons.home
                            : Icons.home_outlined,
                        size: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () => provider.currentPageIndex = 1,
                      child: Icon(
                        provider.currentPageIndex == 1
                            ? Icons.work
                            : Icons.work_outline_outlined,
                        size: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () => provider.currentPageIndex = 2,
                      child: Icon(
                        provider.currentPageIndex == 2
                            ? Icons.person
                            : Icons.person_outline_outlined,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
