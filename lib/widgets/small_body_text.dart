import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallBodyText extends StatelessWidget {
  Color textColor;
  final String text;
  double textSize;
  double lineHeight;
  TextOverflow textOverflow;
  SmallBodyText(
      {Key? key,
      this.textColor = Colors.black26,
      required this.text,
      this.textSize = 12,
      this.lineHeight = 1.2,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
          color: textColor,
          fontSize: textSize,
          height: lineHeight,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat'),
    );
  }
}
