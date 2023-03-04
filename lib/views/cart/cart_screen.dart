import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/views/cart/widgets/cart_screen_listitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/popular_meals_controller.dart';
import '../../core/helper/routes_helper.dart';
import '../../core/utils/colors.dart';
import '../../core/widgets/head_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.spaceHeight50,
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.spaceHeight10,
                    horizontal: Dimensions.spaceHeight10),
                decoration: BoxDecoration(
                    color: AppColors.iconsBkColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.cardRadius20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.recommendedMealDetails);
                      },
                      child: const AppIcons(
                        iconData: Icons.arrow_back_ios_new_rounded,
                        iconSize: 22,
                        iconColor: AppColors.buttonBGColor,
                        iconBackground: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.mainHomeRoute);
                      },
                      child: const AppIcons(
                        iconData: Icons.home,
                        iconColor: AppColors.buttonBGColor,
                        iconBackground: AppColors.mainColor,
                        iconSize: 22,
                      ),
                    ),
                    const AppIcons(
                      iconData: Icons.shopping_cart,
                      iconColor: AppColors.buttonBGColor,
                      iconBackground: AppColors.mainColor,
                      iconSize: 22,
                    ),
                  ],
                ),
              )),
          Positioned(
              top: Dimensions.spaceHeight50 * 2,
              left: Dimensions.spaceWidth10,
              right: Dimensions.spaceWidth10,
              bottom: 0,
              child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: Dimensions.spaceHeight20),
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.getCartItems.length,
                          itemBuilder: (context, index) {
                            return CartScreenListItem(
                              cartModel: controller.getCartItems[index],
                              cartController: controller,
                            );
                          });
                    },
                  )))
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) {
          return Container(
            height: Dimensions.bottomBarHeight,
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.spaceHeight30,
              horizontal: Dimensions.spaceWidth20,
            ),
            margin: EdgeInsets.symmetric(
              vertical: Dimensions.spaceHeight10,
              horizontal: Dimensions.spaceWidth20,
            ),
            decoration: BoxDecoration(
                color: AppColors.iconsBkColor,
                borderRadius: BorderRadius.circular(Dimensions.cardRadius30)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.spaceWidth20),
                    decoration: BoxDecoration(
                        color: AppColors.buttonBGColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius30)),
                    child:
                        HeadLineText(text: "\$ ${controller.calcTotalAmount}"),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      Dimensions.spaceHeight20,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius20)),
                    child: GestureDetector(
                      onTap: () {
                        //controller.addInCart(selectedMeal);
                      },
                      child: HeadLineText(
                        text: "Checkout",
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
