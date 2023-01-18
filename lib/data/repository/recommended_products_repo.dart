import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProducts() async {
    return await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT_ENDPOINT);
  }
}
