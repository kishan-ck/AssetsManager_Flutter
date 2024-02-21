import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget appLoader() {
  return Container(
    color: AppColor.indicatorBlackColor,
    child: const Center(
        child: CircularProgressIndicator(
          color: AppColor.primaryColor,
          strokeWidth: 5,
        )
    ),
  );
}