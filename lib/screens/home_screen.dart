import 'package:firebase_app_hams/screens/tab_screen/profile_screen.dart';
import 'package:firebase_app_hams/screens/tab_screen/m_home_screen.dart';
import 'package:firebase_app_hams/screens/tab_screen/users_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> l = [
    HomeScreen(),
    FriendPage(),
    Profile()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: l[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search),
              label: 'All User'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors),
              label: 'My '
          ),
        ],
      ),
    );
  }
}
