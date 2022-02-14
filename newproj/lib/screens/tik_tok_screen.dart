import 'package:flutter/material.dart';
import 'package:newproj/screens/profile_screen.dart';
import 'package:newproj/util/shared_pref.dart';

import 'home_page.dart';
import 'instagram_list_screen.dart';

class TikTokScreen extends StatefulWidget {
  TikTokScreen({Key? key}) : super(key: key);

  @override
  State<TikTokScreen> createState() => _TikTokScreenState();
}

class _TikTokScreenState extends State<TikTokScreen> {
  final List colors = [
    Colors.white,
    Colors.green,
    Colors.yellow,
    Colors.pink,
  ];

  PageController pageController = PageController();
  int thisIsTheCurrentIndex = 0;

  List<Map> bottomItems = [
    {"icon": Icons.home, "title": "Home"},
    {"icon": Icons.favorite_border, "title": "Favorite"},
    {"icon": Icons.search, "title": "Search"},
    {"icon": Icons.person, "title": "Profile"},
  ];

  List<Widget> screens = [
    InstagramListScreen(),
    Homepage(),
    ProfieScreen(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 40,
      //   ),
      //   elevation: 10,
      //   shape: CircularNotchedRectangle(),
      // ),

      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          currentIndex: thisIsTheCurrentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            pageController.jumpToPage(index);
            thisIsTheCurrentIndex = index;
            SharedPref.logout();
            setState(() {});
          },
          items: List.generate(bottomItems.length, (index) {
            final cureentItem = bottomItems[index];

            return BottomNavigationBarItem(
              icon: Icon(
                cureentItem['icon'],
                color:
                    thisIsTheCurrentIndex == index ? Colors.black : Colors.grey,
                size: 35,
              ),
              label: cureentItem['title'],
            );
          })),
      body: PageView.builder(
        controller: pageController,
        itemCount: screens.length,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (pageIndex) {
          print(pageIndex);
          thisIsTheCurrentIndex = pageIndex;
          setState(() {});
        },
        itemBuilder: (context, index) {
          return screens[index];
        },
      ),
    );
  }
}
