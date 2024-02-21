import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentNewsScreen extends StatelessWidget {
  final String? title;
  final String? content;
  const CurrentNewsScreen({super.key, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColor.transparentColor,
        backgroundColor: AppColor.transparentColor,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: [
                  SizedBox(
                      height: size.height(24),
                      width: size.width(24),
                      child: Icon(
                        Icons.arrow_back,
                        size: size.height(24),
                        color: AppColor.blackColor,
                      )),
                  Text(
                    "Back",
                    style: AppTextStyle.regularText,
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(left: 15),
        centerTitle: true,
        title: const Text("Current News"),
        titleTextStyle:
            AppTextStyle.appbarTitleText.copyWith(color: AppColor.blackColor),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height(30), horizontal: size.width(26)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(AppImagePath.myAssetImage)),
            size.heightSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: AppTextStyle.mediumLargeText),
                Text("01st February, 2024",
                    style: AppTextStyle.regularSubTitleText
                        .copyWith(color: AppColor.k9B9BA3)),
              ],
            ),
            size.heightSpace(21),
            Text(
            title ?? "",
              style: AppTextStyle.appbarTitleText,
            ),
            size.heightSpace(22),
            Text(
              content ?? "",
              style: AppTextStyle.mediumSmallText,
            ),
            size.heightSpace(25),
            Text(
              "Read more at:",
              style: AppTextStyle.mediumSmallText.copyWith(color: AppColor.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
