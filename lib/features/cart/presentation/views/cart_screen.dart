import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'widgets/cart_screen_listitem.dart';


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
                        iconBackground: AppColors.mainOrangeColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.dashboardScreen);
                      },
                      child: const AppIcons(
                        iconData: Icons.home,
                        iconColor: AppColors.buttonBGColor,
                        iconBackground: AppColors.mainOrangeColor,
                        iconSize: 22,
                      ),
                    ),
                    const AppIcons(
                      iconData: Icons.shopping_cart,
                      iconColor: AppColors.buttonBGColor,
                      iconBackground: AppColors.mainOrangeColor,
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
                color: AppColors.buttonBGColor,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFCCCCCC),
                      offset: Offset(0, 0),
                      blurRadius: 15),
                  BoxShadow(
                    color: AppColors.mainLightColor,
                    offset: Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.spaceWidth20),
                    decoration: BoxDecoration(
                        color: AppColors.buttonBGColor,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFCCCCCC),
                              offset: Offset(0, 10),
                              blurRadius: 15),
                          BoxShadow(
                            color: AppColors.mainLightColor,
                            offset: Offset(0, 0),
                          )
                        ],
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius20)),
                    child:
                        HeadLineText(text: "\$ ${controller.calcTotalAmount}"),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      Dimensions.spaceHeight20,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.mainOrangeColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius20)),
                    child: GestureDetector(
                      onTap: () {
                        //controller.addInCart(selectedMeal);
                      },
                      child: HeadLineText(
                        text: "Checkout",
                        textColor: AppColors.mainLightColor,
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
