import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget appLoader() {
  return Container(
    color: AppColor.indicatorBlackColor,
    // height: Get.height,
    // width: Get.width,
    child: const Center(
        child: CircularProgressIndicator(
          color: AppColor.primaryColor,
          strokeWidth: 5,
        )
    ),
  );
}