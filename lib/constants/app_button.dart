import 'package:assetsmanagement/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:assetsmanagement/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final bool isBorder;

  const AppButton(
      {super.key,
        required this.buttonText,
        required this.onPressed,
        this.horizontalPadding,
        this.verticalPadding, this.borderRadius, this.textStyle, required this.isBorder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? size.height(12),
            horizontal: horizontalPadding ?? 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
          gradient: const LinearGradient(
          colors: [AppColor.primaryColor, AppColor.secondPrimaryColor]),
            borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
          child: Text(
            buttonText,
            style: textStyle ?? TextStyle(
                color: AppColor.whiteColor,
                fontSize: size.height(20),
                fontWeight: FontWeight.w800),
          ),
      ),
    );
  }
}
