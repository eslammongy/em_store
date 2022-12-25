import 'package:em_store/data/api/apiclinet.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProducts() async {
    return await apiClient.getData("/api/v1/products/popular");
  }
}
