import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
  int _currentPage = 0;
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
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentPage,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => onTapNavClicked(index),
          items: buildBottomNavBarItems()),
    );
  }

  void onTapNavClicked(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  buildBottomNavBarItems() {
    return <BottomNavyBarItem>[
      BottomNavyBarItem(
        icon: const Icon(Icons.home_rounded),
        title: const Text('Home'),
        activeColor: AppColors.mainColor,
        inactiveColor: AppColors.mainGreyColor,
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        icon: const Icon(Icons.history_rounded),
        title: const Text('History'),
        activeColor: AppColors.mainColor,
        textAlign: TextAlign.center,
        inactiveColor: AppColors.mainGreyColor,
      ),
      BottomNavyBarItem(
        icon: const Icon(Icons.shopping_cart_rounded),
        title: const Text(
          'Cart',
        ),
        activeColor: AppColors.mainColor,
        inactiveColor: AppColors.mainGreyColor,
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        icon: const Icon(Icons.person_rounded),
        title: const Text('Profile'),
        activeColor: AppColors.mainColor,
        inactiveColor: AppColors.mainGreyColor,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
