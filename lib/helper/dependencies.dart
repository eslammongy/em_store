import 'package:em_store/controllers/popular_controller.dart';
import 'package:em_store/data/api/apiclinet.dart';
import 'package:em_store/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // init api client
  Get.lazyPut(() => ApiClient(appBaseUrl: ""));

  // init repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // init controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
