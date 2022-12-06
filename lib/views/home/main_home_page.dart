import 'package:em_store/utils/colors.dart';
import 'package:em_store/views/home/home_page_body.dart';
import 'package:em_store/widgets/head_text.dart';
import 'package:em_store/widgets/small_body_text.dart';
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
          margin: const EdgeInsets.only(top: 50, bottom: 15),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HeadLineText(
                    text: 'Egypt',
                    textColor: AppColors.mainColor,
                    textSize: 25,
                  ),
                  Row(
                    children: [
                      SmallBodyText(
                        text: 'Monomania',
                        textColor: AppColors.textColor,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColors.textColor,
                      )
                    ],
                  )
                ],
              ),
              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.mainColor,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const HomePageBody()
      ],
    ));
  }
}
