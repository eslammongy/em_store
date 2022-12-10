import 'package:em_store/utils/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeadLineText extends StatelessWidget {
  Color textColor;
  final String text;
  double textSize;
  FontWeight textWeight;
  TextOverflow textOverflow;
  HeadLineText(
      {Key? key,
      this.textColor = Colors.black54,
      required this.text,
      this.textSize = 0.0,
      this.textWeight = FontWeight.w500,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
          color: textColor,
          fontSize: textSize == 0 ? Dimensions.headFontSize : textSize,
          fontWeight: textWeight,
          fontFamily: 'Montserrat'),
    );
  }
}
