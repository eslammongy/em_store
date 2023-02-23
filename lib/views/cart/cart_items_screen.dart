import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/helper/utils/dimensions.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/cart_screen_listitem.dart';
import 'package:em_store/views/widgets/custom_image_box.dart';
import 'package:em_store/views/widgets/head_text.dart';
import 'package:em_store/views/widgets/small_body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../helper/routes_helper.dart';
import '../../helper/utils/app_constant.dart';
import '../../helper/utils/colors.dart';
import '../widgets/custom_circlur_progress.dart';

class CartItemScreen extends StatefulWidget {
  const CartItemScreen({super.key});

  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
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
