import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'colors.dart';

void displaySnackBarCart(String title, String msg) {
  Get.snackbar(title, msg,
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      icon: const Icon(Icons.info_outline_rounded));
}
