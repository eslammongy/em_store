import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:em_store/controllers/recommended_meals_controller.dart';
import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/core/widgets/expanded_text.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../core/helper/helper_fun.dart';
import '../../core/utils/app_constant.dart';
import '../../core/widgets/custom_circlur_progress.dart';

class RecommendedMealsDetails extends StatelessWidget {
  final int mealId;
  final String pageName;
  const RecommendedMealsDetails({super.key, required this.mealId, required this.pageName});

  @override
  Widget build(BuildContext context) {
    var selectedMeal =
        Get.find<RecommendedMealsController>().recommendedProductsList[mealId];
    Get.find<PopularMealsController>()
        .initMealsItems(selectedMeal, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
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
                        iconData: Icons.clear,
                      ),
                    ),
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
                          const AppIcons(
                              iconData: Icons.shopping_cart_outlined),
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
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.iconsBkColor),
                                  ),
                                )
                              : Container()
                        ]),
                      );
                    })
                  ]),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.cardRadius20),
                        topRight: Radius.circular(Dimensions.cardRadius20)),
                  ),
                  child: Center(
                    child: HeadLineText(
                      text: '${selectedMeal.name}',
                      textSize: Dimensions.headFontSize26,
                      textWeight: FontWeight.w700,
                      textColor: AppColors.mainBlackColor,
                    ),
                  ),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 249, 161, 9),
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
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
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.spaceWidth10,
                      right: Dimensions.spaceWidth10,
                    ),
                    child: ExpendableTextWidget(
                        expendedText: '${selectedMeal.description}'),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularMealsController>(builder: (controller) {
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
                  color: AppColors.iconsBkColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius30)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(Dimensions.spaceHeight10),
                        decoration: BoxDecoration(
                            color: AppColors.buttonBGColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.cardRadius20)),
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
                            borderRadius:
                                BorderRadius.circular(Dimensions.cardRadius20)),
                        child: HeadLineText(
                          text: "\$${selectedMeal.price} | Add To Cart",
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ]),
            ),
          ]);
        }));
  }
}
