import 'package:em_store/views/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

import '../../helper/utils/colors.dart';
import '../../helper/utils/dimensions.dart';
import 'head_text.dart';
import 'icon_and_icon_widget.dart';

class ReusableColumnCard extends StatelessWidget {
  final String cardTitle;
  const ReusableColumnCard({super.key, required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 15,
      ),
      HeadLineText(
        text: cardTitle,
        textSize: Dimensions.headFontSize26,
      ),
      SizedBox(
        height: Dimensions.spaceHeight10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      SizedBox(
        height: Dimensions.spaceHeight20,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
        IconAndTextWidget(
            icon: Icons.circle, color: AppColors.mainColor, text: 'normal'),
        IconAndTextWidget(
            icon: Icons.location_on, color: Colors.green, text: '36.6km'),
        IconAndTextWidget(
            icon: Icons.alarm_rounded,
            color: AppColors.mainColor,
            text: '24min'),
      ])
    ]);
  }
}
