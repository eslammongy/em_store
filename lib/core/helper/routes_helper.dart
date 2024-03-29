import 'package:em_store/features/cart/presentation/views/cart_screen.dart';
import 'package:em_store/features/dashboard/dashboard_screen.dart';
import 'package:em_store/features/home/main_home_page.dart';
import 'package:em_store/features/splash/splash_screen.dart';
import 'package:get/get.dart';
import '../../features/meals/presentation/views/popular_meals/popular_meals_details.dart';
import '../../features/meals/presentation/views/recommended_meals/recommended_meals_details.dart';

class RoutesHelper {
  static const String initialRoute = "/";
  static const String dashboardScreen = "/dashboardScreen";
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
    GetPage(name: dashboardScreen, page: () => const DashboardScreen()),
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
