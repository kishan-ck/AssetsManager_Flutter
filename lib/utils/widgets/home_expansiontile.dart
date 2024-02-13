import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/utils/widgets/custometile.dart' as c;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeExpansionTile extends StatelessWidget {
  final List<Widget> children;
  String? title;
  double? width;
  Color? outerBorderColor;
  Color? mainBGColor;
  Color? bGColor;
  Color? dropDownIconColor;
  Color? subBGColor;
  final double tileMargin;
  final TextStyle? titleTextStyle;
  final bool initialExpand;
  final Key? exKey;
  final EdgeInsetsGeometry? childrenPadding;
  final Function(bool)? onExpansionChange;
  final bool isShadow;
  bool? isSearch = false;
  Widget? searchWidget;
  BorderRadius? outerBorderRadius;
  final c.ExpansionTileController? tileController;
  HomeExpansionTile({
    super.key,
    required this.children,
    this.title,
    this.tileMargin = 15,
    this.initialExpand = true,
    this.isShadow = true,
    this.tileController,
    this.isSearch,
    this.outerBorderColor,
    this.bGColor,
    this.dropDownIconColor,
    this.mainBGColor,
    this.subBGColor,
    this.searchWidget,
    this.outerBorderRadius,
    this.width,
    this.onExpansionChange,
    this.exKey,
    this.titleTextStyle,
    this.childrenPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: tileMargin),
      padding: const EdgeInsets.only(right: 15, left: 15, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: mainBGColor ?? AppColor.primaryColor,
          border: isShadow
              ? const Border()
              : Border.all(color: outerBorderColor ?? AppColor.primaryColor.withOpacity(0.50)),
          boxShadow: isShadow
              ? [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 15,
                      spreadRadius: 0,
                      color: AppColor.blackColor.withOpacity(0.12))
                ]
              : [],
          borderRadius: outerBorderRadius ??
              const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: c.ExpansionTileCustome(
              key: exKey,
              controller: tileController,
              initiallyExpanded: initialExpand,
              onExpansionChanged: onExpansionChange,
              childrenPadding: childrenPadding,
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: isSearch == true
                  ? searchWidget ?? const SizedBox()
                  : Expanded(
                      child: Container(
                        color: subBGColor ?? AppColor.primaryColor,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: titleTextStyle ??
                                AppTextStyle.largeText.copyWith(color: AppColor.whiteColor, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
              dropDownIconColor: dropDownIconColor ?? AppColor.whiteColor,
              expandedAlignment: Alignment.centerLeft,
              backgroundColor: bGColor ?? AppColor.primaryColor,
              collapsedIconColor: AppColor.redColor,
              iconColor: AppColor.redColor,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
