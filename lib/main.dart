import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/helper/dependencies.dart' as helper;
import 'features/meals/presentation/controllers/recommended_meals_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await helper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularMealsController>(
      builder: (controller) {
        return GetBuilder<RecommendedMealsController>(builder: (_) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: RoutesHelper.initialRoute,
            getPages: RoutesHelper.routes,
          );
        });
      },
    );
  }
}
