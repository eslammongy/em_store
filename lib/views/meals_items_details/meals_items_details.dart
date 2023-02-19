import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:em_store/helper/utils/colors.dart';
import 'package:em_store/helper/utils/dimensions.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/column_rating_card.dart';
import 'package:em_store/views/widgets/expanded_text.dart';

import '../widgets/head_text.dart';

class MealsItemsDetails extends StatelessWidget {
  int mealId;
  MealsItemsDetails({
    Key? key,
    required this.mealId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var meal = Get.find<PopularMealsController>().popularProductsList[mealId];
    print("Meal Name=> ${meal.name}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularProductImgBg,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/offer_2.png'))),
              )),
          Positioned(
              top: Dimensions.spaceHeight50,
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const MainHomePage());
                      },
                      child: const AppIcons(
                          iconData: Icons.arrow_back_ios_new_rounded)),
                  const AppIcons(iconData: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularProductImgBg - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.spaceWidth20,
                      right: Dimensions.spaceWidth20,
                      top: Dimensions.spaceWidth20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.cardRadius20),
                          topRight: Radius.circular(Dimensions.cardRadius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableColumnCard(
                        cardTitle: 'Sample Card Tile',
                      ),
                      SizedBox(
                        height: Dimensions.spaceHeight20,
                      ),
                      HeadLineText(text: 'Introduce '),
                      SizedBox(
                        height: Dimensions.spaceHeight20,
                      ),
                      const Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: ExpendableTextWidget(
                              expendedText:
                                  'Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisions Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisions'),
                        ),
                      )
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.only(
            top: Dimensions.spaceHeight30,
            bottom: Dimensions.spaceHeight30,
            left: Dimensions.spaceWidth20,
            right: Dimensions.spaceWidth20),
        decoration: BoxDecoration(
            color: AppColors.buttonBGColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.cardRadius20 * 2),
                topRight: Radius.circular(Dimensions.cardRadius20 * 2))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.spaceHeight20,
                bottom: Dimensions.spaceHeight20,
                left: Dimensions.spaceWidth20,
                right: Dimensions.spaceWidth20),
            decoration: BoxDecoration(
                color: Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
            child: Row(
              children: [
                const Icon(
                  Icons.remove,
                  color: AppColors.mainBlackColor,
                ),
                SizedBox(
                  width: Dimensions.spaceWidth10 / 2,
                ),
                HeadLineText(text: '0'),
                SizedBox(
                  width: Dimensions.spaceWidth10 / 2,
                ),
                const Icon(
                  Icons.add,
                  color: AppColors.mainBlackColor,
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
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
            child: HeadLineText(
              text: '\$10 Add To Cart',
              textColor: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
