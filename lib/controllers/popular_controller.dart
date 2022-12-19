import 'package:em_store/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductsList => _popularProductList;
  Future<void> getPopularProductsList() async {
    Response response = await popularProductRepo.getPopularProducts();
    if (response.statusCode == 200) {
      _popularProductList = [];
      //_popularProductList.addAll('iterable');
      update();
    } else {}
  }
}
