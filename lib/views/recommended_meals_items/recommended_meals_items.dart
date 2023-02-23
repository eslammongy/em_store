import 'package:em_store/helper/utils/colors.dart';
import 'package:em_store/helper/utils/dimensions.dart';
import 'package:em_store/views/widgets/app_icons.dart';
import 'package:em_store/views/widgets/expanded_text.dart';
import 'package:em_store/views/widgets/head_text.dart';
import 'package:flutter/material.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcons(
                    iconData: Icons.clear,
                  ),
                  AppIcons(
                    iconData: Icons.shopping_cart,
                  )
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.cardRadius20),
                        topRight: Radius.circular(Dimensions.cardRadius20)),
                   ),
                child: Center(
                  child: HeadLineText(
                    text: 'Random Text',
                    textSize: Dimensions.headFontSize26,
                    textColor: AppColors.mainBlackColor,
                  ),
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 249, 161, 9),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/pexels_anthony_derosa.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.spaceWidth10,
                    right: Dimensions.spaceWidth10,
                  ),
                  child: const ExpendableTextWidget(
                      expendedText:
                          'Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsthe workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsthe workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsthe workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsthe workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsthe workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsthe workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally  Logical thinking is a valued trait in the workplace because it allows people to think rationally when making decisions. It is a soft skill that is an integral part of a programming unit. This is because logic is required to analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisionsto analyze a problem, formulate a plan, code a solution, evaluate the program,  and justify decisions'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.spaceWidth10,
              right: Dimensions.spaceWidth10,
              top: Dimensions.spaceHeight10,
              bottom: Dimensions.spaceHeight10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppIcons(
                iconData: Icons.remove,
                iconBackground: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconsSize,
              ),
              SizedBox(
                width: Dimensions.spaceWidth10 / 2,
              ),
              HeadLineText(
                text: '\$120 X 0',
                textColor: AppColors.mainBlackColor,
                textSize: Dimensions.headFontSize26,
              ),
              SizedBox(
                width: Dimensions.spaceWidth10 / 2,
              ),
              AppIcons(
                iconData: Icons.add,
                iconBackground: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconsSize,
              )
            ],
          ),
        ),
        Container(
          height: Dimensions.bottomBarHeight,
          padding: EdgeInsets.only(
              top: Dimensions.spaceHeight30,
              bottom: Dimensions.spaceHeight30,
              left: Dimensions.spaceWidth20,
              right: Dimensions.spaceWidth20),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.cardRadius20 * 2),
                  topRight: Radius.circular(Dimensions.cardRadius20 * 2))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                padding: EdgeInsets.only(
                    top: Dimensions.spaceHeight15,
                    bottom: Dimensions.spaceHeight15,
                    left: Dimensions.spaceWidth20,
                    right: Dimensions.spaceWidth20),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius:
                        BorderRadius.circular(Dimensions.cardRadius20)),
                child: Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                )),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.spaceHeight15,
                  bottom: Dimensions.spaceHeight15,
                  left: Dimensions.spaceWidth20,
                  right: Dimensions.spaceWidth20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius20)),
              child: HeadLineText(
                text: '\$10 Add To Cart',
                textColor: Colors.white,
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
