import 'package:em_store/utils/colors.dart';
import 'package:em_store/utils/dimensions.dart';
import 'package:flutter/material.dart';

import 'small_body_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const IconAndTextWidget(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: color,
          size: Dimensions.iconsSize,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallBodyText(text: text),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
