import 'package:em_store/models/meals_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_meals_repo.dart';

class RecommendedMealsController extends GetxController {
  final RecommendedMealsRepo RecommendedMealsRepo;
  RecommendedMealsController({required this.RecommendedMealsRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductsList => _recommendedProductList;
  bool _dataIsLoaded = false;
  bool get isLoaded => _dataIsLoaded;
  Future<void> getRecommendedMealsList() async {
    Response response = await RecommendedMealsRepo.getRecommendedMeals();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList
          .addAll(PopularProducts.fromJson(response.body).products);
      _dataIsLoaded = true;
      update();
    } else {}
  }
}
