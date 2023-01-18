import 'package:em_store/data/api/api_client.dart';
import 'package:em_store/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProducts() async {
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_ENDPOINT);
  }
}
