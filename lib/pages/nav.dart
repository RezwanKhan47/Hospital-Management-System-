import 'package:flutter/material.dart';
import 'package:hospital_managment_system/pages/account.dart';
import 'package:hospital_managment_system/pages/help.dart';
import 'package:hospital_managment_system/pages/home.dart';
// Replace with your actual UserAccount file

class Navigator extends StatefulWidget {
  final Map<String, dynamic> userInfo;

  const Navigator({super.key, required this.userInfo});

  @override
  State<Navigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  int _selectedIndex = 0;

  // List of pages for navigation
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Home(),
      Help(),
      Account(userInfo: widget.userInfo),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        backgroundColor: Colors.greenAccent[100],
        selectedItemColor: Colors.cyan[300],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_rounded),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
