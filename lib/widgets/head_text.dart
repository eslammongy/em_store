import 'package:flutter/material.dart';

class HeadLineText extends StatelessWidget {
  Color textColor;
  final String text;
  double textSize;
  TextOverflow textOverflow;
  HeadLineText(
      {Key? key,
      this.textColor = Colors.black54,
      required this.text,
      this.textSize = 20,
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
          fontSize: textSize,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat'),
    );
  }
}
