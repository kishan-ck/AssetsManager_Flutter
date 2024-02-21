// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<BottomNavigationBarController>(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
            ),
            height: size.height(80),
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      controller.selectedIndex = 0;
                      controller.update();
                      Get.find<AddAssetsController>().startAnimation = false;
                      Get.find<AddAssetsController>().update();
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImagePath.globalIcon,
                              color: controller.selectedIndex == 0
                                  ? AppColor.secondPrimaryColor : AppColor.greyColor,
                              height: size.height(24),
                              width: size.width(24),
                            ),
                            size.heightSpace(5),
                            Text("global".tr, style: controller.selectedIndex == 0
                                ? AppTextStyle.regularSubTitleText.copyWith(color: AppColor.secondPrimaryColor, fontSize: 14, fontWeight: FontWeight.w600) : AppTextStyle.regularSubTitleText.copyWith(color: AppColor.greyColor, fontSize: 12),)
                          ],
                        ))
                     ),
                InkWell(
                    onTap: () {
                      controller.selectedIndex = 1;
                      controller.update();
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                          Get.find<AddAssetsController>().startAnimation = true;
                          Get.find<AddAssetsController>().update();
                      });

                    },
                    child: Image.asset(
                      AppImagePath.addAssetIcon,
                      fit: BoxFit.cover,
                      height: controller.selectedIndex == 1 ? 72 : 65,
                    )
                        ),
                InkWell(
                    onTap: () {
                      controller.selectedIndex = 2;
                      controller.update();
                      Get.find<AddAssetsController>().startAnimation = false;
                      Get.find<AddAssetsController>().update();
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImagePath.settingIcon,
                              color: controller.selectedIndex == 2
                                  ? AppColor.secondPrimaryColor : AppColor.greyColor,
                              height: size.height(26),
                              width: size.width(26),
                            ),
                            size.heightSpace(5),
                            Text("setting".tr, style: controller.selectedIndex == 2
                                ? AppTextStyle.regularSubTitleText.copyWith(color: AppColor.secondPrimaryColor, fontSize: 14, fontWeight: FontWeight.w600) : AppTextStyle.regularSubTitleText.copyWith(color: AppColor.greyColor, fontSize: 12),)
                          ],
                        ))
                      ),
              ],
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              return await controller.onWillPop();
            },
            child: controller.screens[controller.selectedIndex],
          ),
        );
      },
    );
  }
}
