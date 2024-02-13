import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownButtonCommon extends StatelessWidget {
  final String value;
  final String? hintText;
  final List<String> dropDownItems;
  final ValueChanged<String?> onChanged;
  final bool? isExpanded;
  final EdgeInsetsGeometry? padding;

  const DropDownButtonCommon({required this.value,
    required this.dropDownItems,
    required this.onChanged,
    this.isExpanded,
    this.padding,
    super.key,
    this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.greyColor.withOpacity(0.1),
          // color: AppColor.redColor,
          borderRadius: BorderRadius.circular(100)),
      child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
                hint: Text(hintText ?? ""),
                borderRadius: BorderRadius.circular(10),
                // padding: padding ?? const EdgeInsets.only(left: 3, right: 3),
                isExpanded: isExpanded ?? true,
                style: AppTextStyle.mediumText.copyWith(color: AppColor.greyColor),
                icon: Container(
                  height: size.height(36),
                  width: size.width(36),
                  padding: const EdgeInsets.all(10.5),
                  decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppImagePath.dropdownIcon),
                ),
                value: value,
                items:
                dropDownItems
                    .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem(value: e, child: Text(e, style: AppTextStyle.regularSubTitleText,)))
                    .toList(),
                onChanged: onChanged),
          )),
    );
  }
}
