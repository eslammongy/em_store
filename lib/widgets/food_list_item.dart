// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/widgets/custom_circlur_progress.dart';
import 'package:flutter/material.dart';

import 'package:em_store/controllers/recommended_controller.dart';
import 'package:em_store/widgets/head_text.dart';
import 'package:em_store/widgets/small_body_text.dart';

import '../utils/app_constant.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_and_icon_widget.dart';

class FoodListItem extends StatelessWidget {
  RecommendedProductController controller;
  int index;
  FoodListItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.spaceWidth20,
          right: Dimensions.spaceWidth20,
          bottom: Dimensions.spaceHeight10),
      child: Row(
        children: [
          SizedBox(
            width: Dimensions.listViewImgSize + 10,
            height: Dimensions.listViewImgSize + 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppConstant.BASE_URL}uploads/${controller.recommendedProductsList[index].img!}",
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.cardRadius20),
                    bottomRight: Radius.circular(Dimensions.cardRadius20)),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
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
                      HeadLineText(
                          text:
                              controller.recommendedProductsList[index].name!),
                      SizedBox(
                        height: Dimensions.spaceHeight10,
                      ),
                      SmallBodyText(
                          maxLines: 2,
                          text: controller
                              .recommendedProductsList[index].description!),
                      SizedBox(
                        height: Dimensions.spaceHeight10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndTextWidget(
                              icon: Icons.circle,
                              color: AppColors.mainColor,
                              text: 'normal'),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              color: Colors.green,
                              text: '36.6km'),
                          IconAndTextWidget(
                              icon: Icons.alarm_rounded,
                              color: AppColors.mainColor,
                              text: '24min'),
                        ],
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
