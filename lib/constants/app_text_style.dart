import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyle {

  static TextStyle regularText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: size.height(16),
      color: AppColor.blackColor);

  static TextStyle regularSubTitleText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: size.height(14),
      color: AppColor.blackColor);

  static TextStyle regularHeadingText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: size.height(36),
      color: AppColor.blackColor);

  static TextStyle mediumText = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: size.height(16),
      color: AppColor.blackColor);

  static TextStyle splashTitleText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: size.height(43),
      color: AppColor.primaryColor);

  static TextStyle mediumTitleText = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: size.height(20),
      color: AppColor.blackColor);

  static TextStyle largeText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: size.height(18),
      color: AppColor.blackColor);
}
