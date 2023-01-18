import 'package:em_store/controllers/popular_controller.dart';
import 'package:em_store/controllers/recommended_controller.dart';
import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/data/repository/popular_product_repo.dart';
import 'package:em_store/utils/app_constant.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_products_repo.dart';

Future<void> init() async {
  // init api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  // init repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // init repositories
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  // init controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  // init controllers
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
