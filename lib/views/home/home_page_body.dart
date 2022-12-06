import 'package:em_store/utils/colors.dart';
import 'package:em_store/widgets/head_text.dart';
import 'package:em_store/widgets/icon_and_icon_widget.dart';
import 'package:em_store/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int position) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              /*  color: position.isEven ? Colors.amber[900] : Colors.purple[300], */
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pexels_carollo.jpg'))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    HeadLineText(text: "Sample Head Text"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallBodyText(text: '4.5'),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallBodyText(text: '128 Comments')
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        IconAndTextWidget(
                            icon: Icons.circle,
                            color: AppColors.mainColor,
                            text: 'normal'),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            color: Colors.green,
                            text: '36.6 km'),
                        IconAndTextWidget(
                            icon: Icons.alarm_rounded,
                            color: AppColors.mainColor,
                            text: '24 min'),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
