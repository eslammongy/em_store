import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/helper/utils/dimensions.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/custom_image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                  const AppIcons(
                    iconData: Icons.arrow_back_ios_new_rounded,
                    iconSize: 22,
                    iconColor: AppColors.buttonBGColor,
                    iconBackground: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: Dimensions.spaceWidth20 * 2,
                  ),
                  const AppIcons(
                    iconData: Icons.home,
                    iconColor: AppColors.buttonBGColor,
                    iconBackground: AppColors.mainColor,
                    iconSize: 22,
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
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20,
              bottom: 0,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: double.maxFinite,
                     child: Row(children: [
                        const CustomImageBox(imageUrl: "imageUrl")
                      ]),
                    );
                  }))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
      ),
    );
  }
}
