import 'package:cached_network_image/cached_network_image.dart';
import 'package:em_store/core/utils/app_constant.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/core/widgets/custom_circlur_progress.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/core/widgets/small_body_text.dart';
import 'package:em_store/data/models/meals_model.dart';
import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {
  const StackLayout({super.key, required this.mealModel, required this.index});
  final MealModel mealModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: 240,
      child: Expanded(
        child: Stack(
          children: [
            Positioned(
              right: 15,
              left: 15,
              top: 110,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFE2E2E2),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            offset: Offset(0, 10),
                            blurRadius: 10),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      HeadLineText(text: mealModel.name!),
                      SizedBox(
                        height: Dimensions.spaceHeight10,
                      ),
                      SmallBodyText(maxLines: 2, text: mealModel.description!),
                      SizedBox(
                        height: Dimensions.spaceHeight10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 0,
              right: 30,
              left: 30,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                width: 100,
                height: 200,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/offer_2.png"),
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
            ),
          ],
        ),
      ),
    );
  }
}
