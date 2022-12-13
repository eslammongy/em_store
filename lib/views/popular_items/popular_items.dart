import 'package:em_store/utils/colors.dart';
import 'package:em_store/utils/dimensions.dart';
import 'package:em_store/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopularProductsDetail extends StatelessWidget {
  const PopularProductsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        image: AssetImage(
                            'assets/images/pexels_anthony_derosa.jpg'))),
              )),
          Positioned(
              top: Dimensions.spaceHeight50,
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcons(iconData: Icons.arrow_back_ios_new_rounded),
                  AppIcons(iconData: Icons.shopping_cart_outlined)
                ],
              ))
        ],
      ),
    );
  }
}
