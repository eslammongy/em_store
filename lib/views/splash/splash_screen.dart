import 'dart:async';

import 'package:em_store/helper/routes_helper.dart';
import 'package:em_store/helper/utils/colors.dart';
import 'package:em_store/views/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      Get.toNamed(RoutesHelper.mainHomeRoute);
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
            begin: Alignment.topCenter,
            end: Alignment
                .bottomCenter, // 10% of the width, so there are ten blinds.
            colors: [Color(0xFFF0F0F0), Colors.white], // red to yellow
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
                  width: 220,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: HeadLineText(
                text: 'Restaurant',
                textColor: AppColors.mainColor,
                textSize: 40,
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

  /*  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  } */
}
