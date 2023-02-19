import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:em_store/controllers/recommended_meals_controller.dart';
import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/data/repository/popular_meals_repo.dart';
import 'package:em_store/utils/app_constant.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_meals_repo.dart';

Future<void> init() async {
  // init api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  // init repositories
  Get.lazyPut(() => PopularMealsRepo(apiClient: Get.find()));
  // init repositories
  Get.lazyPut(() => RecommendedMealsRepo(apiClient: Get.find()));

  // init controllers
  Get.lazyPut(() => PopularMealsController(popularProductRepo: Get.find()));
  // init controllers
  Get.lazyPut(
      () => RecommendedMealsController(RecommendedMealsRepo: Get.find()));
}
