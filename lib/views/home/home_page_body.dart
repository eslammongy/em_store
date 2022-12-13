import 'package:dots_indicator/dots_indicator.dart';
import 'package:em_store/utils/colors.dart';
import 'package:em_store/utils/dimensions.dart';
import 'package:em_store/widgets/column_rating_card.dart';
import 'package:em_store/widgets/head_text.dart';
import 'package:em_store/widgets/icon_and_icon_widget.dart';
import 'package:em_store/widgets/list_product_layout.dart';
import 'package:em_store/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

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
      children: [
        // top slider section
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
            dotsCount: 5,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            )),
        // popular items section
        SizedBox(
          height: Dimensions.spaceHeight30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.spaceWidth30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            HeadLineText(text: "Popular"),
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
            SmallBodyText(text: 'popular products here..')
          ]),
        ),
        // list of products here
        // ignore: sized_box_for_whitespace
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              // build list layout item view
              return const ProductListLayout();
            }),
      ],
    );
  }

// creating slider container
  Widget _buildPageItem(int position) {
    return Transform(
      transform: createMatrixTransform(position),
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.spaceWidth10, right: Dimensions.spaceWidth10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.cardRadius30),
                /*  color: position.isEven ? Colors.amber[900] : Colors.purple[300], */
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/pexels_carollo.jpg'))),
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
                  child: const ReusableColumnCard(
                    cardTitle: 'Sample Card Tile',
                  )),
            ),
          ),
        ],
      ),
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
