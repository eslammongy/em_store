
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/features/meals/data/model/meals_model.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.spaceWidth10,
          vertical: Dimensions.spaceWidth10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                controller.setQuantity(false);
              },
              child: AppIcons(
                iconData: Icons.remove,
                iconBackground: AppColors.mainOrangeColor,
                iconColor: AppColors.mainLightColor,
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
                iconBackground: AppColors.mainOrangeColor,
                iconColor: AppColors.mainLightColor,
                iconSize: Dimensions.iconsSize,
              ),
            )
          ],
        ),
      ),
      Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.spaceHeight30,
          horizontal: Dimensions.spaceWidth20,
        ),
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.spaceHeight15,
          horizontal: Dimensions.spaceHeight20,
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              padding: EdgeInsets.all(Dimensions.spaceHeight10),
              decoration: BoxDecoration(
                  color: AppColors.buttonBGColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFCCCCCC),
                        offset: Offset(0, 5),
                        blurRadius: 15),
                    BoxShadow(
                      color: AppColors.mainLightColor,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius:
                      BorderRadius.circular(Dimensions.cardRadius20 * 2)),
              child: const Icon(
                Icons.favorite_border_rounded,
                color: AppColors.mainOrangeColor,
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
                  color: AppColors.mainOrangeColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
              child: HeadLineText(
                text: "\$${selectedMeal.price} | Add To Cart",
                textColor: AppColors.mainLightColor,
              ),
            ),
          )
        ]),
      ),
    ]);
  }
}
