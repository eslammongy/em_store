import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/features/dashboard/widgets/bottom_nav_bar_items.dart';
import 'package:em_store/features/home/main_home_page.dart';
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
        bottomNavigationBar: SizedBox(
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.cardRadius20),
                topRight: Radius.circular(Dimensions.cardRadius20)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                selectedItemColor: AppColors.mainOrangeColor,
                unselectedItemColor: AppColors.mainGreyColor,
                currentIndex: _selectedPage,
                elevation: 15.0,
                backgroundColor: AppColors.mainGreyColor,
                onTap: (value) {
                  onTapNavClicked(value);
                },
                items: buildBottomNavBarItems()),
          ),
        ));
  }

  void onTapNavClicked(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
