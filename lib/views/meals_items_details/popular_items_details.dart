import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:em_store/helper/utils/colors.dart';
import 'package:em_store/helper/utils/dimensions.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/column_rating_card.dart';
import 'package:em_store/views/widgets/expanded_text.dart';

import '../../helper/utils/app_constant.dart';
import '../widgets/custom_circlur_progress.dart';
import '../widgets/head_text.dart';

class PopularMealsItemsDetails extends StatelessWidget {
  final int mealId;
  const PopularMealsItemsDetails({
    Key? key,
    required this.mealId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedMeal =
        Get.find<PopularMealsController>().popularProductsList[mealId];

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
                child: CachedNetworkImage(
                  width: double.infinity,
                  imageUrl:
                      "${AppConstant.BASE_URL}uploads/${selectedMeal.img!}",
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, progress) {
                    return const Center(child: CustomCircularProgress());
                  },
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_rounded),
                ),
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
                      ReusableColumnCard(
                        cardTitle: '${selectedMeal.name}',
                      ),
                      SizedBox(
                        height: Dimensions.spaceHeight20,
                      ),
                      HeadLineText(text: 'Introduce '),
                      SizedBox(
                        height: Dimensions.spaceHeight20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ExpendableTextWidget(
                              expendedText: '${selectedMeal.description}'),
                        ),
                      )
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularMealsController>(
        builder: (controller) {
          return Container(
            height: Dimensions.bottomBarHeight,
            padding: EdgeInsets.only(
                top: Dimensions.spaceHeight30,
                bottom: Dimensions.spaceHeight30,
                left: Dimensions.spaceWidth20,
                right: Dimensions.spaceWidth20),
            decoration: BoxDecoration(
                color: AppColors.mainGreyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.cardRadius20 * 2),
                    topRight: Radius.circular(Dimensions.cardRadius20 * 2))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.spaceHeight20,
                        bottom: Dimensions.spaceHeight20,
                        left: Dimensions.spaceWidth20,
                        right: Dimensions.spaceWidth20),
                    decoration: BoxDecoration(
                        color: AppColors.iconsBkColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius20)),
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
                        HeadLineText(text: controller.quantity.toString()),
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
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius20)),
                    child: HeadLineText(
                      text: "\$ ${selectedMeal.price} | Add To Cart",
                      textColor: Colors.white,
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}
