import 'package:em_store/widgets/head_text.dart';
import 'package:em_store/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_and_icon_widget.dart';

class ProductListLayout extends StatelessWidget {
  const ProductListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.spaceWidth20,
          right: Dimensions.spaceWidth20,
          bottom: Dimensions.spaceHeight10),
      child: Row(
        children: [
          Container(
            width: Dimensions.listViewImgSize,
            height: Dimensions.listViewImgSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.cardRadius20),
                color: Colors.white12,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('assets/images/pexels_anthony_derosa.jpg'))),
          ),
          Expanded(
            child: Container(
              height: Dimensions.listViewTxtContainerSize,
              padding: EdgeInsets.only(
                left: Dimensions.spaceWidth10,
                right: Dimensions.spaceWidth10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.cardRadius15),
                      bottomRight: Radius.circular(Dimensions.cardRadius15)),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(left: Dimensions.spaceWidth10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadLineText(text: 'Sample Product title and name'),
                      SizedBox(
                        height: Dimensions.spaceHeight10,
                      ),
                      SmallBodyText(text: 'this our product description here '),
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
