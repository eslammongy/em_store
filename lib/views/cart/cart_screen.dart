import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/cart/widgets/cart_screen_listitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/helper/routes_helper.dart';
import '../../core/utils/colors.dart';

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
                  SizedBox(
                    width: Dimensions.spaceWidth20 * 2,
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
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
      ),
    );
  }
}
