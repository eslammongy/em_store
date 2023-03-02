import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedPage = 0;
  final List pages = [
    const MainHomePage(),
    Container(
      child: const Center(child: Text("Page N2")),
    ),
    Container(
      child: const Center(child: Text("Page N3")),
    ),
    Container(
      child: const Center(child: Text("Page N4")),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.mainGreyColor,
          currentIndex: _selectedPage,
          onTap: (value) {
            onTapNavClicked(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded), label: "history"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: "cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded), label: "profile")
          ]),
    );
  }

  void onTapNavClicked(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
