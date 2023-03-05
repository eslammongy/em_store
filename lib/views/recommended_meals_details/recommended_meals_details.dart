import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/controllers/popular_meals_controller.dart';
import 'package:em_store/controllers/recommended_meals_controller.dart';
import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/app_icons.dart';
import 'package:em_store/core/widgets/expanded_text.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/views/recommended_meals_details/widgets/recommended_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../core/helper/helper_fun.dart';
import '../../core/utils/app_constant.dart';
import '../../core/widgets/custom_circlur_progress.dart';
import 'widgets/recomend_bottom_nav_bar.dart';

class RecommendedMealsDetails extends StatelessWidget {
  final int mealId;
  final String pageName;
  const RecommendedMealsDetails(
      {super.key, required this.mealId, required this.pageName});

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
              title: RecommendedDetailsTopBar(pageName: pageName,),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.buttonBGColor,
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
          return RecommendMealBottomNavBar(
            controller: controller,
            selectedMeal: selectedMeal,
          );
        }));
  }
}
