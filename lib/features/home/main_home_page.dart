import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/features/home/widgets/home_page_body.dart';
import 'package:em_store/core/widgets/head_text.dart';
import 'package:em_store/core/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: Dimensions.spaceHeight30, bottom: Dimensions.spaceHeight15),
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.spaceHeight20,
              vertical: Dimensions.spaceHeight10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HeadLineText(
                    text: 'Egypt',
                    textColor: AppColors.mainOrangeColor,
                    textSize: 25,
                  ),
                  Row(
                    children: [
                      SmallBodyText(
                        text: 'Monomania',
                        textColor: AppColors.mainBlackColor,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColors.mainBlackColor,
                      )
                    ],
                  )
                ],
              ),
              Center(
                child: Container(
                  width: Dimensions.spaceHeight50,
                  height: Dimensions.spaceHeight50,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: AppColors.mainLightColor),
                    borderRadius:
                        BorderRadius.circular(Dimensions.cardRadius30),
                    color: AppColors.mainOrangeColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFBCBCBC),
                          offset: Offset(5, 10),
                          blurRadius: 10),
                      BoxShadow(
                        color: AppColors.mainLightColor,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.search,
                    size: Dimensions.iconsSize + 5,
                    color: AppColors.mainLightColor,
                  ),
                ),
              )
            ],
          ),
        ),
        const Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(), child: HomePageBody()))
      ],
    ));
  }
}
