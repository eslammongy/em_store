import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularFoodRepo extends GetxService {
  final ApiClient apiClient;

  PopularFoodRepo({required this.apiClient});

  Future<Response> getPopularProducts() async {
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_ENDPOINT);
  }
}
