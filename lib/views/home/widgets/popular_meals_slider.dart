// creating slider container
import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/core/helper/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/meals_model.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/widgets/column_rating_card.dart';
import '../../../core/widgets/custom_circlur_progress.dart';

Widget buildPopularSlider(int index, MealModel mealModel, Matrix4 matrix4) {
  return Transform(
    transform: matrix4,
    child: GestureDetector(
      onTap: () {
        Get.toNamed(RoutesHelper.getPopularMealDetails(index, "HomePage"));
      },
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.spaceWidth10, right: Dimensions.spaceWidth10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.cardRadius20),
              /*  color: position.isEven ? Colors.amber[900] : Colors.purple[300], */
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.cardRadius20),
              child: CachedNetworkImage(
                width: double.infinity,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.spaceWidth30,
                  right: Dimensions.spaceWidth30,
                  bottom: Dimensions.spaceWidth10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0, 5),
                        blurRadius: 5.0),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ReusableColumnCard(
                    cardTitle: mealModel.name!,
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
