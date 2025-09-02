import 'package:flutter/material.dart';
//import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/presentation/screens/explore_page.dart';
import 'package:news_app/presentation/screens/home_page.dart';
import 'package:news_app/presentation/screens/saved_page.dart';
import 'package:news_app/presentation/screens/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> mWidgets = [
    HomePage(),
    ExplorePage(),
    SavedPage(),
    SettingPage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(AppConstants.APPNAME), centerTitle: true),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: mWidgets[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.grey),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: Colors.purple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, color: Colors.grey),
            label: 'Explore',
            activeIcon: Icon(Icons.explore, color: Colors.purple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outlined, color: Colors.grey),
            label: 'Saved',
            activeIcon: Icon(Icons.bookmark, color: Colors.purple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, color: Colors.grey),
            label: 'Settings',
            activeIcon: Icon(Icons.settings, color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
