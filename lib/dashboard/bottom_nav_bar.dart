import 'package:animalicu/dashboard/screen/dashboard.dart';
import 'package:animalicu/profile/screens/pro_dash.dart';
import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  static const routeName = "/bottom-bar";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    dashboard(),
    ProfileScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.indigo[900],
        height: 55,
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: updatePage,
      ),
    );
  }
}
