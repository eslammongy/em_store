import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/data/models/meals_model.dart';
import 'package:em_store/core/widgets/small_body_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/popular_meals_controller.dart';
import '../../../controllers/recommended_meals_controller.dart';
import '../../../core/helper/routes_helper.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../data/models/cart_model.dart';
import '../../../core/widgets/custom_image_box.dart';
import '../../../core/widgets/head_text.dart';

class CartScreenListItem extends StatelessWidget {
  final CartModel cartModel;
  final CartController cartController;
  const CartScreenListItem(
      {super.key, required this.cartModel, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.listViewTxtContainerSize,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.spaceHeight10 - 5,
        horizontal: Dimensions.spaceWidth10,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                goBackFromCart(cartModel.mealModel!);
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  width: Dimensions.listViewImgSize,
                  height: Dimensions.listViewImgSize,
                  child: CustomImageBox(
                      imageUrl:
                          "${AppConstant.BASE_URL}uploads/${cartModel.img!}")),
            ),
            Expanded(
                child: SizedBox(
              height: Dimensions.spaceHeight20 * 20,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.spaceHeight10 - 5,
                  horizontal: Dimensions.spaceWidth10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainLightColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.cardRadius15 - 5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 8,
                        offset: Offset(1, 1),
                        spreadRadius: 2),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeadLineText(
                        text: "${cartModel.name}",
                        textSize: 18,
                        textWeight: FontWeight.w600,
                      ),
                      SmallBodyText(text: "${cartModel.addingTime}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadLineText(
                            text: "\$${cartModel.price}",
                            textColor: Colors.orangeAccent,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.spaceHeight10,
                                horizontal: Dimensions.spaceWidth10),
                            decoration: BoxDecoration(
                                color: AppColors.buttonBGColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cartController.addItemInCart(
                                        cartModel.mealModel!, -1);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColors.mainBlackColor,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.spaceWidth10 / 2,
                                ),
                                HeadLineText(
                                    text: "${cartModel.quantity}".toString()),
                                SizedBox(
                                  width: Dimensions.spaceWidth10 / 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cartController.addItemInCart(
                                        cartModel.mealModel!, 1);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.mainBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ))
          ]),
    );
  }

  void goBackFromCart(MealModel mealModel) {
    var popularIndex = Get.find<PopularMealsController>()
        .popularProductsList
        .indexOf(cartModel.mealModel!);

    if (popularIndex >= 0) {
      Get.toNamed(RoutesHelper.getPopularMealDetails(popularIndex, "CartPage"));
    } else {
      var recommendedIndex = Get.find<RecommendedMealsController>()
          .recommendedProductsList
          .indexOf(cartModel.mealModel!);
      Get.toNamed(
          RoutesHelper.getRecommendedMealDetails(recommendedIndex, "CartPage"));
    }
  }
}
