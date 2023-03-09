import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/features/cart/presentation/controllers/cart_controller.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
import 'package:em_store/features/meals/presentation/views/popular_meals/widgets/popular_details_appbar.dart';
import 'package:em_store/features/meals/presentation/views/popular_meals/widgets/popular_details_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/column_rating_card.dart';
import 'package:em_store/core/widgets/expanded_text.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/widgets/custom_circlur_progress.dart';
import '../../../../../core/widgets/head_text.dart';

class PopularMealsDetails extends StatelessWidget {
  final int mealId;
  final String pageName;
  const PopularMealsDetails({
    Key? key,
    required this.mealId,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedMeal =
        Get.find<PopularMealsController>().popularProductsList[mealId];
    Get.find<PopularMealsController>()
        .initMealsItems(selectedMeal, Get.find<CartController>());

    return Scaffold(
      backgroundColor: AppColors.mainLightColor,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.maxFinite,
                height: Dimensions.popularProductImgBg,
                child: CachedNetworkImage(
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
              )),
          Positioned(
              top: Dimensions.spaceHeight30,
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20,
              child: PopularDetailsAppBar(
                pageName: pageName,
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: -5,
              top: Dimensions.popularProductImgBg - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.spaceWidth20,
                      right: Dimensions.spaceWidth20,
                      top: Dimensions.spaceWidth20),
                  decoration: BoxDecoration(
                    color: AppColors.mainLightColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.cardRadius20),
                        topRight: Radius.circular(Dimensions.cardRadius20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableColumnCard(
                        cardTitle: '${selectedMeal.name}',
                      ),
                      SizedBox(
                        height: Dimensions.spaceHeight20,
                      ),
                      HeadLineText(text: 'Introduce '),
                      SizedBox(
                        height: Dimensions.spaceHeight20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ExpendableTextWidget(
                              expendedText: '${selectedMeal.description}'),
                        ),
                      )
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularMealsController>(
        builder: (controller) {
          return PopularDetailsBottomBar(
              controller: controller, selectedMeal: selectedMeal);
        },
      ),
    );
  }
}
