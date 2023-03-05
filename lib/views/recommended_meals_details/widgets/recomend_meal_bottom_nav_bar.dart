import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:em_store/controllers/recommended_meals_controller.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/data/models/meals_model.dart';
import 'package:flutter/material.dart';

class RecommendMealBottomNavBar extends StatelessWidget {
  const RecommendMealBottomNavBar(
      {super.key, required this.controller, required this.selectedMeal});
  final PopularMealsController controller;
  final MealModel selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        padding: EdgeInsets.only(
            left: Dimensions.spaceWidth10,
            right: Dimensions.spaceWidth10,
            top: Dimensions.spaceHeight10,
            bottom: Dimensions.spaceHeight10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                controller.setQuantity(false);
              },
              child: AppIcons(
                iconData: Icons.remove,
                iconBackground: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconsSize,
              ),
            ),
            SizedBox(
              width: Dimensions.spaceWidth10 / 2,
            ),
            HeadLineText(
              text: "\$${selectedMeal.price} * ${controller.inCartItems}",
              textColor: AppColors.mainBlackColor,
              textSize: Dimensions.headFontSize26,
            ),
            SizedBox(
              width: Dimensions.spaceWidth10 / 2,
            ),
            GestureDetector(
              onTap: () {
                controller.setQuantity(true);
              },
              child: AppIcons(
                iconData: Icons.add,
                iconBackground: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconsSize,
              ),
            )
          ],
        ),
      ),
      Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.only(
            top: Dimensions.spaceHeight30,
            bottom: Dimensions.spaceHeight30,
            left: Dimensions.spaceWidth20,
            right: Dimensions.spaceWidth20),
        margin: EdgeInsets.only(
            bottom: Dimensions.spaceHeight10,
            left: Dimensions.spaceWidth10,
            right: Dimensions.spaceWidth10),
        decoration: BoxDecoration(
            color: Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(Dimensions.cardRadius30)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              padding: EdgeInsets.all(Dimensions.spaceHeight10),
              decoration: BoxDecoration(
                  color: AppColors.buttonBGColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.cardRadius20 * 2)),
              child: const Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              )),
          GestureDetector(
            onTap: () {
              controller.addInCart(selectedMeal);
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.spaceHeight15,
                  bottom: Dimensions.spaceHeight15,
                  left: Dimensions.spaceWidth20,
                  right: Dimensions.spaceWidth20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
              child: HeadLineText(
                text: "\$${selectedMeal.price} | Add To Cart",
                textColor: Colors.white,
              ),
            ),
          )
        ]),
      ),
    ]);
  }
}
