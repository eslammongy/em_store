import 'package:em_store/data/repository/popular_meals_repo.dart';
import 'package:em_store/models/meals_model.dart';
import 'package:get/get.dart';

class PopularMealsController extends GetxController {
  final PopularMealsRepo popularProductRepo;
  PopularMealsController({required this.popularProductRepo});

  List<MealModel> _popularProductList = [];
  List<MealModel> get popularProductsList => _popularProductList;
  bool _dataIsLoaded = false;
  bool get isLoaded => _dataIsLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  Future<void> getPopularMealsList() async {
    Response response = await popularProductRepo.getPopularMeals();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList
          .addAll(PopularProducts.fromJson(response.body).products);
      _dataIsLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _quantity + 1;
    } else {
      _quantity = _quantity - 1;
    }
    update();
  }
}
