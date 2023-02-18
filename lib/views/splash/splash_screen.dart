import 'dart:async';

import 'package:em_store/utils/colors.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/views/recommended_product/recommended_items.dart';
import 'package:em_store/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_controller.dart';
import '../popular_items/popular_items.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MainHomePage()));
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363636),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment
                .bottomRight, // 10% of the width, so there are ten blinds.
            colors: [Color(0xFFE7E7E7), Colors.white], // red to yellow
            tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                padding: EdgeInsets.zero,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.fill,
                  width: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: HeadLineText(
                text: 'Store',
                textColor: AppColors.mainColor,
                textSize: 50,
                textWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // timer.cancel();
  }
}
