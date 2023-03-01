import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:em_store/core/helper/helper_fun.dart';
import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/views/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/views/home/main_home_page.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/column_rating_card.dart';
import 'package:em_store/views/widgets/expanded_text.dart';

import '../../core/utils/app_constant.dart';
import '../widgets/custom_circlur_progress.dart';
import '../widgets/head_text.dart';

class PopularMealsDetails extends StatelessWidget {
  final int mealId;
  final String pageName;
  const PopularMealsDetails({
    Key? key,
    required this.mealId,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedMeal =
        Get.find<PopularMealsController>().popularProductsList[mealId];
    Get.find<PopularMealsController>()
        .initMealsItems(selectedMeal, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
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
                        if (pageName == "CartPage") {
                          Get.toNamed(RoutesHelper.getCartScreen());
                        } else {
                          Get.toNamed(RoutesHelper.mainHomeRoute);
                        }
                      },
                      child: const AppIcons(
                          iconData: Icons.arrow_back_ios_new_rounded)),
                  GetBuilder<PopularMealsController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalCartItems >= 1) {
                          Get.toNamed(RoutesHelper.cartScreen);
                        } else {
                          displaySnackBarCart("Cart Info",
                              "Your cart is empty, please add first.");
                        }
                      },
                      child: Stack(children: [
                        const AppIcons(iconData: Icons.shopping_cart_outlined),
                        Get.find<PopularMealsController>().totalCartItems >= 1
                            ? const Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcons(
                                  iconData: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  iconBackground: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        Get.find<PopularMealsController>().totalCartItems >= 1
                            ? Positioned(
                                right: 5,
                                top: 2,
                                child: Text(
                                  "${Get.find<PopularMealsController>().totalCartItems}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.iconsBkColor),
                                ),
                              )
                            : Container()
                      ]),
                    );
                  })
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: -5,
              top: Dimensions.popularProductImgBg - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.spaceWidth20,
                      right: Dimensions.spaceWidth20,
                      top: Dimensions.spaceWidth20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xC3CDCDCD),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
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
            margin: EdgeInsets.only(
                bottom: Dimensions.spaceHeight10,
                left: Dimensions.spaceWidth10,
                right: Dimensions.spaceWidth10),
            decoration: BoxDecoration(
                color: AppColors.iconsBkColor,
                borderRadius: BorderRadius.circular(Dimensions.cardRadius30)),
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
                        color: AppColors.buttonBGColor,
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
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius20)),
                    child: GestureDetector(
                      onTap: () {
                        controller.addInCart(selectedMeal);
                      },
                      child: HeadLineText(
                        text: "\$${selectedMeal.price} - Add To Cart",
                        textColor: Colors.white,
                      ),
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }

}
