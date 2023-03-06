import 'package:flutter/material.dart';
import '../../../controllers/popular_meals_controller.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/widgets/head_text.dart';
import '../../../data/models/meals_model.dart';

class PopularDetailsBottomBar extends StatelessWidget {
  const PopularDetailsBottomBar(
      {super.key, required this.controller, required this.selectedMeal});
  final PopularMealsController controller;
  final MealModel selectedMeal;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.bottomBarHeight,
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.spaceHeight30,
        horizontal: Dimensions.spaceWidth20,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.spaceHeight10,
        horizontal: Dimensions.spaceWidth10,
      ),
      decoration: BoxDecoration(
          color: AppColors.mainLightColor,
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFCCCCCC),
                offset: Offset(5, 10),
                blurRadius: 15),
            BoxShadow(
              color: AppColors.mainLightColor,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(Dimensions.cardRadius30)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.spaceHeight20,
            horizontal: Dimensions.spaceWidth20,
          ),
          decoration: BoxDecoration(
              color: AppColors.buttonBGColor,
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFFCCCCCC),
                    offset: Offset(5, 10),
                    blurRadius: 15),
                BoxShadow(
                  color: AppColors.mainLightColor,
                  offset: Offset(0, 0),
                )
              ],
              borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.setQuantity(false);
                },
                child: const Icon(
                  Icons.remove,
                  color: AppColors.mainBlackColor,
                ),
              ),
              SizedBox(
                width: Dimensions.spaceWidth10 / 2,
              ),
              HeadLineText(text: controller.inCartItems.toString()),
              SizedBox(
                width: Dimensions.spaceWidth10 / 2,
              ),
              GestureDetector(
                onTap: () {
                  controller.setQuantity(true);
                },
                child: const Icon(
                  Icons.add,
                  color: AppColors.mainBlackColor,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              top: Dimensions.spaceHeight20,
              bottom: Dimensions.spaceHeight20,
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20),
          decoration: BoxDecoration(
              color: AppColors.mainOrangeColor,
              borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
          child: GestureDetector(
            onTap: () {
              controller.addInCart(selectedMeal);
            },
            child: HeadLineText(
              text: "\$${selectedMeal.price} - Add To Cart",
              textColor: AppColors.mainLightColor,
            ),
          ),
        )
      ]),
    );
    ;
  }
}
