import 'package:em_store/core/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'head_text.dart';
import 'icon_and_text_widget.dart';

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
        textWeight: FontWeight.w500,
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
                      color: AppColors.mainOrangeColor,
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
            icon: Icons.circle,
            color: AppColors.mainOrangeColor,
            text: 'normal'),
        IconAndTextWidget(
            icon: Icons.location_on, color: Colors.green, text: '36.6km'),
        IconAndTextWidget(
            icon: Icons.alarm_rounded,
            color: AppColors.mainOrangeColor,
            text: '24min'),
      ])
    ]);
  }
}
