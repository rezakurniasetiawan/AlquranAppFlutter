import 'package:alquran_app/Screen/Account.dart';
import 'package:alquran_app/Screen/home_page.dart';
import 'package:alquran_app/Screen/jadwalsholat.dart';
import 'package:alquran_app/Screen/read_alquran.dart';
import 'package:alquran_app/main.dart';

import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.username});
  final String username;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final List<Widget> _children = [
    Homepage(
      username: username,
    ),
    JadwalSholat(),
    ReadAlquran(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[selectedIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Color(0xFF00695C),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.timelapse,
            label: 'Sholat',
          ),
          FFNavigationBarItem(
            iconData: Icons.my_library_books_rounded,
            label: 'Read Alquran',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
