import 'package:em_store/core/utils/colors.dart';
import 'package:em_store/core/utils/dimensions.dart';
import 'package:em_store/views/widgets/small_body_text.dart';
import 'package:flutter/material.dart';

//preparing app for calling api && fetching data
class ExpendableTextWidget extends StatefulWidget {
  final String expendedText;
  const ExpendableTextWidget({super.key, required this.expendedText});

  @override
  State<ExpendableTextWidget> createState() => _ExpendableTextWidgetState();
}

class _ExpendableTextWidgetState extends State<ExpendableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textLength = Dimensions.screenHeight / 5.80;

  @override
  void initState() {
    super.initState();
    if (widget.expendedText.length > textLength) {
      firstHalf = widget.expendedText.substring(0, textLength.toInt());
      secondHalf = widget.expendedText
          .substring(textLength.toInt() + 1, widget.expendedText.length);
    } else {
      firstHalf = widget.expendedText;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallBodyText(
              text: firstHalf,
              maxLines: 3,
              lineHeight: 1.4,
              textColor: AppColors.mainGreyColor,
              textSize: Dimensions.headFontSize16,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallBodyText(
                    maxLines: 20,
                    textSize: Dimensions.headFontSize16,
                    textColor: AppColors.mainGreyColor,
                    lineHeight: 1.4,
                    text: hiddenText
                        ? ('$firstHalf...')
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallBodyText(
                        maxLines: 1,
                        text: hiddenText ? 'Read More..' : 'Show less..',
                        textColor: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up_outlined,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
