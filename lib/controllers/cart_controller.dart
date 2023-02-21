import 'package:em_store/models/meals_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _cartItems = {};

  void addItemInCart(MealModel mealModel, int quantity) {
    _cartItems.putIfAbsent(
        mealModel.id!,
        () => CartModel(
            id: mealModel.id,
            name: mealModel.name,
            price: mealModel.price,
            img: mealModel.img,
            quantity: quantity,
            isExist: true,
            addingTime: DateTime.now().toString()));
  }
}
