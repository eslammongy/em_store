import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/controllers/recommended_meals_controller.dart';
import 'package:em_store/helper/routes_helper.dart';
import 'package:em_store/helper/utils/colors.dart';
import 'package:em_store/helper/utils/dimensions.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/expanded_text.dart';
import 'package:em_store/views/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/utils/app_constant.dart';
import '../widgets/custom_circlur_progress.dart';

class RecommendedItems extends StatelessWidget {
  final int mealId;
  const RecommendedItems({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    var selectedMeal =
        Get.find<RecommendedMealsController>().recommendedProductsList[mealId];
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
                      Get.toNamed(RoutesHelper.mainHomeRoute);
                    },
                    child: const AppIcons(
                      iconData: Icons.clear,
                    ),
                  ),
                  const AppIcons(
                    iconData: Icons.shopping_cart,
                  )
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
                imageUrl: "${AppConstant.BASE_URL}uploads/${selectedMeal.img!}",
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
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.spaceWidth10,
              right: Dimensions.spaceWidth10,
              top: Dimensions.spaceHeight10,
              bottom: Dimensions.spaceHeight10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppIcons(
                iconData: Icons.remove,
                iconBackground: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconsSize,
              ),
              SizedBox(
                width: Dimensions.spaceWidth10 / 2,
              ),
              HeadLineText(
                text: "\$${selectedMeal.price} * 0",
                textColor: AppColors.mainBlackColor,
                textSize: Dimensions.headFontSize26,
              ),
              SizedBox(
                width: Dimensions.spaceWidth10 / 2,
              ),
              AppIcons(
                iconData: Icons.add,
                iconBackground: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconsSize,
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
          decoration: BoxDecoration(
              color: AppColors.mainOrangeColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.cardRadius20 * 2),
                  topRight: Radius.circular(Dimensions.cardRadius20 * 2))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                padding: EdgeInsets.all(Dimensions.spaceHeight10),
                decoration: BoxDecoration(
                    color: AppColors.iconsBkColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.cardRadius20)),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                )),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.spaceHeight15,
                  bottom: Dimensions.spaceHeight15,
                  left: Dimensions.spaceWidth20,
                  right: Dimensions.spaceWidth20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
              child: HeadLineText(
                text: "\$${selectedMeal.price} | Add To Cart",
                textColor: Colors.white,
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
