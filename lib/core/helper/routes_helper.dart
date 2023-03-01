import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/views/splash/splash_screen.dart';
import 'package:get/get.dart';
import '../../views/cart/cart_screen.dart';
import '../../views/popular_meals_details/popular_meals_details.dart';
import '../../views/recommended_meals_details/recommended_meals_details.dart';

class RoutesHelper {
  static const String initialRoute = "/";
  static const String mainHomeRoute = "/mainHomeRoute";

  static const String popularMealDetails = "/popularMealDetails";
  static String getPopularMealDetails(int mealID, String pageName) =>
      "$popularMealDetails?mealId=$mealID&page=$pageName";

  static const String recommendedMealDetails = "/recommendedMealDetails";
  static String getRecommendedMealDetails(int mealID, String pageName) =>
      "$recommendedMealDetails?mealId=$mealID&page=$pageName";

  static const String cartScreen = "/CartScreen";
static String getCartScreen() =>
      cartScreen;
  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(name: mainHomeRoute, page: () => const MainHomePage()),
    GetPage(
        name: popularMealDetails,
        page: () {
          var mealId = Get.parameters['mealId'];
          var pageName = Get.parameters['page'];
          return PopularMealsDetails(
              mealId: int.parse(mealId!), pageName: pageName!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedMealDetails,
        page: () {
          var mealId = Get.parameters['mealId'];
            var pageName = Get.parameters['page'];
          return RecommendedMealsDetails(
            mealId: int.parse(mealId!),
             pageName: pageName!
          );
        },
        transition: Transition.fadeIn),
    GetPage(name: getCartScreen(), page: (() => const CartScreen()))
  ];
}
