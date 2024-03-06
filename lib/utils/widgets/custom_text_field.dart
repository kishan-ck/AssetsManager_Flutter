// ignore_for_file: must_be_immutable
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  TextStyle? hintStyle;
  EdgeInsetsGeometry? contentPadding;
  TextStyle? inputTextStyle;
  TextStyle? labelStyle;
  String? hintText;
  String? labelText;
  TextAlign? textAlign;
  double? width;
  double? height;
  double? horizontalPadding;
  double? verticalPadding;
  Widget? prefixIcn;
  Widget? suffixIcn;
  Color? cursorColor;
  Color? fillColor;
  Color? underLineFocusColor;
  Color? inputTextColor;
  Color? underLineEnabledColor;
  Function? validator;
  Function()? onTap;
  Function? onChange;
  Function? onFieldSubmitted;
  TextInputType textInputType;
  List<TextInputFormatter>? inputFormatters;
  bool readOnly;
  bool obscureText;
  bool autofocus;
  bool isBorderEnable;
  bool isExpand;
  bool isEnable;
  BorderRadius? isUnderLineBorderRadius;
  bool isShadow;
  int? minLines;
  int? maxLength;
  int? maxLines;
  int? errorMaxLines;
  FocusNode? focusNode;
  String? obscuringCharacter;

  CustomTextField(
      {super.key,
      this.controller,
      this.inputTextColor,
      this.contentPadding = const EdgeInsets.only(top: 0, bottom: 10, left: 15),
      this.hintText,
      this.isShadow = true,
      this.isBorderEnable = true,
      this.hintStyle,
      this.inputTextStyle,
      this.obscureText = false,
      this.autofocus = false,
      this.isExpand = false,
      this.isEnable = true,
      this.isUnderLineBorderRadius,
      this.labelText,
      this.onTap,
      this.verticalPadding,
      this.horizontalPadding,
      this.inputFormatters,
      this.labelStyle,
      this.width,
      this.fillColor,
      this.onFieldSubmitted,
      this.cursorColor,
      this.underLineFocusColor,
      this.underLineEnabledColor,
      this.minLines,
      this.maxLines,
      this.maxLength,
      this.prefixIcn,
      this.suffixIcn,
      this.height,
      this.textAlign,
      this.validator,
      this.onChange,
      this.textInputType = TextInputType.name,
      this.readOnly = false,
      this.errorMaxLines,
      this.focusNode,
        this.obscuringCharacter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          isShadow == true
              ? BoxShadow(
                  color: AppColor.blackColor.withOpacity(0.02),
                  blurRadius: 10.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 1))
              : const BoxShadow(color: Colors.transparent),
        ],
      ),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 0),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        readOnly: readOnly,
        textAlign: textAlign ?? TextAlign.left,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter ?? "*",
        cursorColor: cursorColor ?? AppColor.secondPrimaryColor,
        minLines: isExpand == true ? null : minLines ?? 1,
        maxLines: isExpand == true ? null : maxLines,
        expands: isExpand,
        maxLength: maxLength,
        autofocus: autofocus,
        enabled: isEnable,
        style: inputTextStyle,
        onTap: onTap,
        focusNode: focusNode,
        inputFormatters: inputFormatters ?? [],
        onFieldSubmitted: (value) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted!(value);
          }
        },
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          height = 75;
          return null;
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: const TextStyle(
                color: AppColor.redColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            errorMaxLines: errorMaxLines,
            focusedBorder: isBorderEnable == true
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            underLineFocusColor ?? AppColor.secondPrimaryColor),
                    borderRadius:
                        isUnderLineBorderRadius ?? BorderRadius.circular(10))
                : null,
            enabledBorder: isBorderEnable == true
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            underLineEnabledColor ?? AppColor.transparentColor),
                    borderRadius:
                        isUnderLineBorderRadius ?? BorderRadius.circular(10))
                : null,
            disabledBorder: isBorderEnable == true
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: underLineEnabledColor ?? AppColor.whiteColor),
                    borderRadius:
                        isUnderLineBorderRadius ?? BorderRadius.circular(10))
                : null,
            errorBorder: isBorderEnable == true
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.redColor),
                    borderRadius:
                        isUnderLineBorderRadius ?? BorderRadius.circular(10))
                : null,
            focusedErrorBorder: isBorderEnable == true
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.redColor),
                    borderRadius:
                        isUnderLineBorderRadius ?? BorderRadius.circular(10))
                : null,
            counterText: "",
            contentPadding: contentPadding,
            hintText: hintText,
            labelText: labelText,
            filled: true,
            fillColor: fillColor ?? AppColor.whiteColor,
            prefixIcon: prefixIcn,
            suffixIcon: suffixIcn,
            hintStyle: hintStyle ??
                AppTextStyle.regularSubTitleText.copyWith(
                    color: AppColor.greyColor, overflow: TextOverflow.ellipsis),
            labelStyle: labelStyle ??
                AppTextStyle.regularSubTitleText.copyWith(
                    color: AppColor.greyColor,
                    overflow: TextOverflow.ellipsis)),
      ),
    );
  }
}
