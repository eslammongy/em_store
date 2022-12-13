import 'package:em_store/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final Color iconBackground;
  final double iconSize;
  const AppIcons(
      {Key? key,
      required this.iconData,
      this.iconColor = const Color(0xFF756d54),
      this.iconBackground = const Color(0xFFfcf4e4),
      this.iconSize = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(iconSize / 2),
          color: iconBackground),
      child: Icon(
        iconData,
        size: Dimensions.iconsSize16,
        color: iconColor,
      ),
    );
  }
}
