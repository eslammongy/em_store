import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/helper/helper_fun.dart';
import '../../../../../../core/utils/colors.dart';

class PopularDetailsAppBar extends StatelessWidget {
  const PopularDetailsAppBar({super.key, required this.pageName});
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              if (pageName == "CartPage") {
                Get.toNamed(RoutesHelper.getCartScreen());
              } else {
                Get.toNamed(RoutesHelper.dashboardScreen);
              }
            },
            child: const AppIcons(
              iconData: Icons.arrow_back_ios_new_rounded,
              iconBackground: AppColors.buttonBGColor,
            )),
        GetBuilder<PopularMealsController>(builder: (controller) {
          return GestureDetector(
            onTap: () {
              if (controller.totalCartItems >= 1) {
                Get.toNamed(RoutesHelper.cartScreen);
              } else {
                displaySnackBarCart(
                    "Cart Info", "Your cart is empty, please add first.");
              }
            },
            child: Stack(children: [
              const AppIcons(
                iconData: Icons.shopping_cart_outlined,
                iconBackground: AppColors.buttonBGColor,
              ),
              Get.find<PopularMealsController>().totalCartItems >= 1
                  ? const Positioned(
                      right: 0,
                      top: 0,
                      child: AppIcons(
                        iconData: Icons.circle,
                        size: 20,
                        iconColor: Colors.transparent,
                        iconBackground: AppColors.mainOrangeColor,
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
    );
  }
}
