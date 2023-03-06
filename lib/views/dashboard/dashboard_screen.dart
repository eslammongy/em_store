import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/views/dashboard/widgets/bottom_nav_bar_items.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:flutter/material.dart';

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
      child: Center(child: Text("Page N2")),
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
            selectedItemColor: AppColors.mainOrangeColor,
            unselectedItemColor: AppColors.mainGreyColor,
            currentIndex: _selectedPage,
            onTap: (value) {
              onTapNavClicked(value);
            },
            items: buildBottomNavBarItems()));
  }

  void onTapNavClicked(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
