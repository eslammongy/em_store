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
    MainHomePage(),
    Container(
      child: Center(child: Text("Page N2")),
    ),
    Container(
      child: Center(child: Text("Page N3")),
    ),
    Container(
      child: Center(child: Text("Page N4")),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
    );
  }
}
