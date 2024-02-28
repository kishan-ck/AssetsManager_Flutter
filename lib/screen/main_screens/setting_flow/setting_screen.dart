import 'dart:convert';

import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/controller/setting_controller.dart';
import 'package:assetsmanagement/screen/auth_module/login_screen.dart';
import 'package:assetsmanagement/screen/main_screens/setting_flow/view_assets_flow/view_all_user_assets.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:assetsmanagement/utils/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SettingController>(),
      builder: (controller) {
        return Stack(
            alignment: Alignment.center,
            children: [
                 Scaffold(
                   body: SingleChildScrollView(
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          size.heightSpace(25),
                          Container(
                            height: size.height(150),
                            width: size.width(150),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.whiteColor),
                            child: controller.getUserModelData?.data?.image != null ?
                            ClipRRect(
                              borderRadius: BorderRadius.circular(105),
                              child: Image.memory(
                                const Base64Decoder().convert(controller.getUserModelData?.data?.image?.split(',').elementAt(1) ?? ""),
                                fit: BoxFit.cover,
                              ),
                            )
                                : const Center(
                              child: Icon(Icons.camera_alt),
                            ),
                          ),
                          size.heightSpace(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.getUserModelData?.data?.fullname ?? "",
                                    style: AppTextStyle.appbarTitleText,
                                  ),
                                  Text(
                                    controller.getUserModelData?.data?.email ?? "",
                                    style: AppTextStyle.regularSubTitleText,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.showUpdateProfileDialog(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: const BoxDecoration(
                                    color: AppColor.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(AppImagePath.editIcon,
                                      height: size.height(23)),
                                ),
                              ),
                            ],
                          ),
                          size.heightSpace(15),
                          Container(
                            padding: const EdgeInsets.all(15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  AppColor.primaryColor,
                                  AppColor.secondPrimaryColor
                                ]),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                      AppColor.secondPrimaryColor.withOpacity(0.1),
                                      blurRadius: 12,
                                      spreadRadius: 0,
                                      offset: const Offset(3, 5))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "50",
                                              style: TextStyle(
                                                  color: AppColor.whiteColor,
                                                  fontSize: size.height(50),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "my_assets".tr,
                                              style: AppTextStyle.largeText
                                                  .copyWith(color: AppColor.whiteColor),
                                            ),
                                          ],
                                        ),
                                        size.widthSpace(20),
                                        // Text(
                                        //   "my_assets".tr,
                                        //   style: AppTextStyle.largeText
                                        //       .copyWith(color: AppColor.whiteColor),
                                        // ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "50",
                                              style: TextStyle(
                                                  color: AppColor.whiteColor,
                                                  fontSize: size.height(50),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "my_categories".tr,
                                              style: AppTextStyle.largeText
                                                  .copyWith(color: AppColor.whiteColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                size.heightSpace(10),
                                GestureDetector(
                                  onTap: () async {
                                    await controller.getAssetData();
                                    Get.to(() => const ViewAllUserAssetsScreen());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height(5),
                                        horizontal: size.width(15)),
                                    decoration: BoxDecoration(
                                        color: AppColor.blackColor,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Text(
                                      "view_all".tr,
                                      style: AppTextStyle.largeText.copyWith(
                                          color: AppColor.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          size.heightSpace(15),
                          SizedBox(
                            height: Get.height/4,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.menuList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      controller.menuList[index]['icon'],
                                      color: AppColor.blackColor,
                                      height: size.height(24),
                                    ),
                                    size.widthSpace(17),
                                    Text(
                                      controller.menuList[index]['text'],
                                      style: AppTextStyle.regularSubTitleText,
                                      textAlign: TextAlign.center,
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        index == 1
                                            ? Text(
                                          "English",
                                          style: AppTextStyle.regularSubTitleText
                                              .copyWith(
                                            color: AppColor.greyColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                            : const SizedBox(),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.blackColor,
                                          size: size.height(24),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: size.height(25),
                              ),
                            ),
                          ),
                          size.heightSpace(40),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "logout".tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    titleTextStyle: AppTextStyle.largeText
                                        .copyWith(color: AppColor.primaryColor),
                                    content: const Text(
                                        "Are your sure you want to logout ?",
                                        textAlign: TextAlign.center),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    backgroundColor: AppColor.whiteColor,
                                    actionsAlignment: MainAxisAlignment.spaceAround,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("Cancel",
                                              style: AppTextStyle.appbarTitleText)),
                                      TextButton(
                                          onPressed: () async {
                                            Get.offAll(() => LoginScreen());
                                            clearLocalStorage();
                                            await setDataToLocalStorage(
                                                dataType: StorageKey.boolType,
                                                boolData: false,
                                                prefKey: StorageKey.isLogin);
                                          },
                                          child: Text("Logout",
                                              style: AppTextStyle.appbarTitleText
                                                  .copyWith(
                                                  color:
                                                  AppColor.secondPrimaryColor)))
                                    ],
                                  );
                                },
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImagePath.logoutIcon,
                                  color: AppColor.redColor,
                                  height: size.height(24),
                                ),
                                size.widthSpace(17),
                                Text(
                                  "Log Out",
                                  style: AppTextStyle.regularSubTitleText
                                      .copyWith(color: AppColor.redColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).paddingAll(23),
                   ),
                 ),
              controller.isLoading ? appLoader() : const SizedBox()
                ],
          );
      },
    );
  }
}
