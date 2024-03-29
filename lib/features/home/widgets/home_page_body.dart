import 'package:dots_indicator/dots_indicator.dart';
import 'package:em_store/features/meals/presentation/controllers/popular_meals_controller.dart';
import 'package:em_store/features/meals/presentation/controllers/recommended_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/features/home/widgets/popular_meals_slider.dart';
import 'package:em_store/core/widgets/custom_circlur_progress.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/features/home/widgets/recommend_meals_listitem.dart';
import 'package:em_store/core/widgets/small_body_text.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final _cardHeight = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    setState(() {
      pageController.addListener(() {
        setState(() {
          _currentPageValue = pageController.page!;
          //print("Current Page Value:: $_currentPageValue");
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // top slider section
        GetBuilder<PopularMealsController>(builder: (popularProducts) {
          var dataLoaded = popularProducts.isLoaded;
          return dataLoaded
              ? SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductsList.length,
                      itemBuilder: (context, position) {
                        return buildPopularSlider(
                            position,
                            popularProducts.popularProductsList[position],
                            createMatrixTransform(position));
                      }),
                )
              : const CustomCircularProgress();
        }),
        GetBuilder<PopularMealsController>(builder: (popularProducts) {
          return DotsIndicator(
              dotsCount: popularProducts.popularProductsList.isEmpty
                  ? 1
                  : popularProducts.popularProductsList.length,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainOrangeColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ));
        }),
        // popular items section
        SizedBox(
          height: Dimensions.spaceHeight30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.spaceWidth30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            HeadLineText(
              text: "Recommended",
              textWeight: FontWeight.w700,
            ),
            SizedBox(
              width: Dimensions.spaceWidth10,
            ),
            HeadLineText(
              text: ".",
              textColor: AppColors.mainBlackColor,
            ),
            SizedBox(
              width: Dimensions.spaceWidth10,
            ),
            SmallBodyText(text: 'Recommended meals here..')
          ]),
        ),
        // list of products here
        // ignore: sized_box_for_whitespace
        GetBuilder<RecommendedMealsController>(
            builder: ((recommendedController) {
          return recommendedController.isLoaded
              ? ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      recommendedController.recommendedProductsList.length,
                  itemBuilder: (context, index) {
                    // build list layout item view
                    return RecommendedMealsItem(
                      mealModel:
                          recommendedController.recommendedProductsList[index],
                      index: index,
                    );
                  })
              : const CustomCircularProgress();
        })),
      ],
    );
  }

  Matrix4 createMatrixTransform(int position) {
    Matrix4 matrix4 = Matrix4.identity();

    if (position == _currentPageValue.floor()) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTrans = _cardHeight * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor +
          (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currentTrans = _cardHeight * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTrans = _cardHeight * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _cardHeight * (1 - currentScale) / 2, 1);
    }

    return matrix4;
  }
}
