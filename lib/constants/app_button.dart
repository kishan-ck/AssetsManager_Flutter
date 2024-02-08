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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? size.height(12),
            horizontal: horizontalPadding ?? 0),
        backgroundColor: isBorder == true ? AppColor.whiteColor : AppColor.blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          side: isBorder == true?
          const BorderSide(
            color: AppColor.blueColor,
            width: 2
          ) : const BorderSide(
            color: Colors.transparent
          )
        ),
      ),
      onPressed: onPressed,
      child: Center(
          child: Text(
            buttonText,
            style: textStyle ?? TextStyle(
                color: isBorder == true ? AppColor.blueColor: AppColor.whiteColor,
                fontSize: size.height(20),
                fontWeight: FontWeight.w800),
          )),
    );
  }
}
