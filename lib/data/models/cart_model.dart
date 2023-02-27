import 'package:em_store/data/models/meals_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? addingTime;
  MealModel? mealModel;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExist,
      this.addingTime,
      this.mealModel});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    addingTime = json['addingTime'];
    mealModel = MealModel.fromJson(json['mealModel']);
  }
}
