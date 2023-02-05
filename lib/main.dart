import 'package:em_store/controllers/popular_controller.dart';
import 'package:em_store/controllers/recommended_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/splash/splash_screen.dart';
import 'helper/dependencies.dart' as helper;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await helper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductsList();
    Get.find<RecommendedProductController>().getRecommendedProductsList();
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
