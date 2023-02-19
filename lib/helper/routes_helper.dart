import 'package:em_store/main.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/views/splash/splash_screen.dart';
import 'package:em_store/views/widgets/recommend_meals_listitem.dart';
import 'package:get/get.dart';

import '../views/meals_items_details/meals_items_details.dart';
import '../views/recommended_food_items/recommended_items.dart';

class RoutesHelper {
  static const String initialRoute = "/";
  static const String mainHomeRoute = "/mainHomeRoute";

  static const String popularMealDetails = "/popularMealDetails";
  static String getPopularMealDetails(int mealID) =>
      "$popularMealDetails?mealId=$mealID";

  static const String recommendedMealDetails = "/recommendedMealDetails";

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(name: mainHomeRoute, page: () => const MainHomePage()),
    GetPage(
        name: popularMealDetails,
        page: () {
          var mealId = Get.parameters['mealId'];
          print("Meal ID => $mealId");
          return MealsItemsDetails(
            mealId: int.parse(mealId!),
          );
        },
        transition: Transition.cupertino),
    GetPage(
        name: recommendedMealDetails,
        page: () => const RecommendedItems(),
        transition: Transition.cupertino)
  ];
}
