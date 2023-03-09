import 'package:em_store/features/cart/presentation/controllers/cart_controller.dart';
import 'package:em_store/core/api/api_client.dart';
import 'package:em_store/features/cart/data/repository/cart_repo.dart';
import 'package:em_store/core/utils/app_constant.dart';
import 'package:em_store/features/meals/data/repository/popular_meals_repo.dart';
import 'package:em_store/features/meals/data/repository/recommended_meals_repo.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
import 'package:em_store/features/meals/presentation/controllers/recommended_meals_controller.dart';
import 'package:get/get.dart';


Future<void> init() async {
  // init api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  // init repositories
  Get.lazyPut(() => PopularMealsRepo(apiClient: Get.find()));
  // init repositories
  Get.lazyPut(() => RecommendedMealsRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // init controllers
  Get.lazyPut(() => PopularMealsController(popularProductRepo: Get.find()));
  // init controllers
  Get.lazyPut(
      () => RecommendedMealsController(recommendedMealsRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
