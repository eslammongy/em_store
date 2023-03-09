import 'package:em_store/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildBottomNavBarItems() {
  /*  BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"), */
  return <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      backgroundColor: AppColors.iconsBkColor,
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.archivebox_fill),
      backgroundColor: AppColors.iconsBkColor,
      label: 'History',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cart_fill),
      label: 'Cart',
      backgroundColor: AppColors.iconsBkColor,
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
      backgroundColor: AppColors.iconsBkColor,
    ),
  ];
}
