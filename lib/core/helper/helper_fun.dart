import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/colors.dart';

void displaySnackBarCart(String title, String msg) {
  Get.snackbar(title, msg,
      backgroundColor: AppColors.mainOrangeColor,
      colorText: AppColors.mainLightColor,
      icon: const Icon(Icons.info_outline_rounded));
}
