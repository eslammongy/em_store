import 'dart:async';
import 'dart:ui';

import 'package:em_store/utils/colors.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/widgets/head_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
/*   late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MainHomePage()));
      timer.cancel();
    });
  } */

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
            colors: [Color(0xff2b2b2b), Colors.black45], // red to yellow
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
                  'assets/images/icons_digital_clock.png',
                  fit: BoxFit.fill,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            HeadLineText(
              text: 'Clock Store',
              textColor: AppColors.mainColor,
              textSize: 35,
              textWeight: FontWeight.w700,
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
