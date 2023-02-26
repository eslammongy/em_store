import 'package:em_store/data/models/meals_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_meals_repo.dart';

class RecommendedMealsController extends GetxController {
  final RecommendedMealsRepo recommendedMealsRepo;
  RecommendedMealsController({required this.recommendedMealsRepo});

  List<MealModel> _recommendedProductList = [];
  List<MealModel> get recommendedProductsList => _recommendedProductList;
  bool _dataIsLoaded = false;
  bool get isLoaded => _dataIsLoaded;
  Future<void> getRecommendedMealsList() async {
    Response response = await recommendedMealsRepo.getRecommendedMeals();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList
          .addAll(PopularProducts.fromJson(response.body).products);
      _dataIsLoaded = true;
      update();
    } else {}
  }
}
