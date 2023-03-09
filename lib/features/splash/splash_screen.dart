import 'dart:async';
import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
import 'package:em_store/features/meals/presentation/controllers/recommended_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer timer;

  late Animation<double> animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    loadResources();
    initAnim();
    navigateToDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: HeadLineText(
              text: 'Restaurant',
              textColor: AppColors.mainOrangeColor,
              textSize: 40,
              textWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void navigateToDashboard() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Get.offNamed(RoutesHelper.dashboardScreen);
      timer.cancel();
    });
  }

  void initAnim() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  loadResources() async {
    await Get.find<PopularMealsController>().getPopularMealsList();
    await Get.find<RecommendedMealsController>().getRecommendedMealsList();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
