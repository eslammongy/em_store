import 'package:em_store/core/helper/helper_fun.dart';
import 'package:em_store/data/models/meals_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../data/models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _cartItems = {};
  Map<int, CartModel> get cartItems => _cartItems;

  void addItemInCart(MealModel mealModel, int quantity) {
    var totalQuantity = 0;
    if (_cartItems.containsKey(mealModel.id)) {
      _cartItems.update(mealModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            addingTime: DateTime.now().toString(),
            mealModel: mealModel);
      });

      if (totalQuantity <= 0) {
        _cartItems.remove(mealModel.id);
      }
    } else {
      if (quantity > 0) {
        _cartItems.putIfAbsent(mealModel.id!, () {
          return CartModel(
              id: mealModel.id,
              name: mealModel.name,
              price: mealModel.price,
              img: mealModel.img,
              quantity: quantity,
              isExist: true,
              addingTime: DateTime.now().toString(),
              mealModel: mealModel);
        });
      } else {
        displaySnackBarCart(
            "Adding In Cart", "please add at least one item to adding in cart");
      }
    }
    update();
  }

  bool checkItemExistInCart(MealModel mealModel) {
    if (_cartItems.containsKey(mealModel.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(MealModel mealModel) {
    var quantity = 0;
    if (_cartItems.containsKey(mealModel.id)) {
      _cartItems.forEach((key, value) {
        if (key == mealModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalQuantity {
    var totalQuantity = 0;
    _cartItems.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getCartItems {
    return _cartItems.entries.map((item) {
      return item.value;
    }).toList();
  }

  int get calcTotalAmount {
    var total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }
}
