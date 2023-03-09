import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildBottomNavBarItems() {
  /*  BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"), */
  return <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.archivebox_fill),
      label: 'History',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cart_fill),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
    ),
  ];
}
