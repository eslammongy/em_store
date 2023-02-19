// creating slider container
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/meals_model.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/column_rating_card.dart';
import '../../../widgets/custom_circlur_progress.dart';

Widget buildPageItem(int position, ProductModel productModel, Matrix4 matrix4) {
  return Transform(
    transform: matrix4,
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
              imageUrl: "${AppConstant.BASE_URL}uploads/${productModel.img!}",
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
                  cardTitle: productModel.name!,
                )),
          ),
        ),
      ],
    ),
  );
}
