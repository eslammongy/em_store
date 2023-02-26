import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.08;
  // dynamic space height padding && margin
  static double spaceHeight10 = screenHeight / 84.4;
  static double spaceHeight15 = screenHeight / 56.27;
  static double spaceHeight20 = screenHeight / 42.2;
  static double spaceHeight30 = screenHeight / 28.13;
  static double spaceHeight50 = screenHeight / 15.2;
  // dynamic space width padding && margin
  static double spaceWidth10 = screenHeight / 84.4;
  static double spaceWidth15 = screenHeight / 56.27;
  static double spaceWidth20 = screenHeight / 42.2;
  static double spaceWidth30 = screenHeight / 28.13;
  // dynamic card radius
  static double cardRadius15 = screenHeight / 56.27;
  static double cardRadius20 = screenHeight / 42.2;
  static double cardRadius30 = screenHeight / 28.13;
  // dynamic font size
  static double headFontSize = screenHeight / 42.2;
  static double headFontSize16 = screenHeight / 52.75;
  static double headFontSize26 = screenHeight / 32.46;
  // dynamic icon size
  static double iconsSize = screenHeight / 40.17;
  static double iconsSize16 = screenHeight / 52.75;
  // list view layout
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTxtContainerSize = screenWidth / 3.9;

  static double popularProductImgBg = screenHeight / 2.41;

  static double bottomBarHeight = screenHeight / 7.03;
}
