import 'package:em_store/helper/utils/colors.dart';
import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final Color iconBackground;
  final double size;
  final double iconSize;
  const AppIcons(
      {Key? key,
      required this.iconData,
      this.iconColor = AppColors.mainBlackColor,
      this.iconBackground = AppColors.iconsBkColor,
      this.size = 40,
      this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: iconBackground),
      child: Icon(
        iconData,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
