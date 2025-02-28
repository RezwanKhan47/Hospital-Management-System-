import 'package:flutter/material.dart';
import 'package:hospital_managment_system/pages/account.dart';
import 'package:hospital_managment_system/pages/help.dart';
import 'package:hospital_managment_system/pages/home.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  void _Navigatpages(int index) {
    setState(() {
      myIndex = index;
    });
  }

  final List _pages = [
    Home(),
    Help(),
    Account(
      userInfo: {},
    )
  ];
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[myIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: myIndex,
            onTap: _Navigatpages,

            // showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.greenAccent[100],
            selectedItemColor: Colors.cyan[300],
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    // color: Colors.cyan[300],
                    size: 35,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital_rounded,
                      // color: Colors.cyan[300],
                      size: 35),
                  label: 'Help'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                      // color: Colors.cyan[300],
                      size: 35),
                  label: 'Account'),
            ]));
  }
}
