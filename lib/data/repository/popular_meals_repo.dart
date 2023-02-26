import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/core/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularMealsRepo extends GetxService {
  final ApiClient apiClient;

  PopularMealsRepo({required this.apiClient});

  Future<Response> getPopularMeals() async {
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_ENDPOINT);
  }
}
