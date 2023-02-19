import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/helper/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendedMealsRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedMealsRepo({required this.apiClient});

  Future<Response> getRecommendedMeals() async {
    return await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT_ENDPOINT);
  }
}
