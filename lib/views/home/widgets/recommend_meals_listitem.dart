// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/core/helper/routes_helper.dart';
import 'package:em_store/data/models/meals_model.dart';
import 'package:em_store/core/widgets/custom_circlur_progress.dart';
import 'package:flutter/material.dart';

import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/core/widgets/small_body_text.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_constant.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/widgets/icon_and_text_widget.dart';

class RecommendedMealsItem extends StatelessWidget {
  MealModel mealModel;
  int index;
  RecommendedMealsItem({
    Key? key,
    required this.mealModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesHelper.getRecommendedMealDetails(index, "HomePage"));
      },
      child: Container(
        margin: EdgeInsets.only(
          left: Dimensions.spaceWidth20,
          right: Dimensions.spaceWidth20,
          bottom: Dimensions.spaceHeight10,
        ),
        child: Row(
          children: [
            Container(
              width: Dimensions.listViewImgSize + 10,
              height: Dimensions.listViewImgSize + 10,
              decoration: BoxDecoration(
                color: AppColors.iconsBkColor,
                borderRadius: BorderRadius.circular(90),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFCCCCCC),
                      offset: Offset(0, 10),
                      blurRadius: 10),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.cardRadius20),
                child: CachedNetworkImage(
                  imageUrl: "${AppConstant.BASE_URL}uploads/${mealModel.img!}",
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, progress) {
                    return const Center(child: CustomCircularProgress());
                  },
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_rounded),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: Dimensions.listViewImgSize,
                // margin: EdgeInsets.only(left: -10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.cardRadius15),
                      bottomRight: Radius.circular(Dimensions.cardRadius15)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFCCCCCC),
                        offset: Offset(0, 10),
                        blurRadius: 10),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.spaceHeight10,
                    right: Dimensions.spaceWidth10,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadLineText(text: mealModel.name!),
                        SizedBox(
                          height: Dimensions.spaceHeight10,
                        ),
                        SmallBodyText(
                            maxLines: 2, text: mealModel.description!),
                        SizedBox(
                          height: Dimensions.spaceHeight10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            IconAndTextWidget(
                                icon: Icons.circle,
                                color: AppColors.mainOrangeColor,
                                text: 'normal'),
                            IconAndTextWidget(
                                icon: Icons.location_on,
                                color: Colors.green,
                                text: '36.6km'),
                            IconAndTextWidget(
                                icon: Icons.alarm_rounded,
                                color: AppColors.mainOrangeColor,
                                text: '24min'),
                          ],
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
