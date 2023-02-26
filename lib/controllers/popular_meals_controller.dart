import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/data/repository/popular_meals_repo.dart';
import 'package:em_store/core/helper/helper_fun.dart';
import 'package:em_store/data/models/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/colors.dart';
import '../data/models/cart_model.dart';

class PopularMealsController extends GetxController {
  final PopularMealsRepo popularProductRepo;
  PopularMealsController({required this.popularProductRepo});

  late CartController _cartController;
  List<MealModel> _popularProductList = [];
  List<MealModel> get popularProductsList => _popularProductList;
  bool _dataIsLoaded = false;
  bool get isLoaded => _dataIsLoaded;
  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
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
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      displaySnackBarCart("Cart Items", "Your cart is already empty !");
      if (_inCartItems > 0) {
        _quantity = _inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      displaySnackBarCart("Cart Items",
          "Your cart is fullfil, you can't adding items anymore !");
      return 20;
    } else {
      return quantity;
    }
  }

  void initMealsItems(MealModel mealModel, CartController cartController) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    var exist = false;
    exist = _cartController.checkItemExistInCart(mealModel);
    if (exist) {
      _inCartItems = _cartController.getQuantity(mealModel);
    }
  }

  void addInCart(MealModel mealModel) {
    _cartController.addItemInCart(mealModel, _quantity);
    _quantity = 0;
    _inCartItems = _cartController.getQuantity(mealModel);
    update();
  }

  int get totalCartItems {
    return _cartController.totalQuantity;
  }

  List<CartModel> get getCartItems {
    return _cartController.getCartItems;
  }
}
