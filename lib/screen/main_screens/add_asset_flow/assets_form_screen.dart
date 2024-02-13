import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:assetsmanagement/utils/widgets/common_dropdown_button.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:assetsmanagement/utils/widgets/home_expansiontile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetFormScreen extends StatelessWidget {
  const AssetFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: Row(
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: SizedBox(
                height: size.height(24),
                width: size.width(24),
                  child: Icon(Icons.arrow_back,size: size.height(24),color: AppColor.whiteColor,)),
            ),
          ],
        ).paddingOnly(left: 15),
        centerTitle: true,
        title: const Text("Land Asset"),
        titleTextStyle: AppTextStyle.appbarTitleText.copyWith(color: AppColor.whiteColor),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
        actions: [
          Image.asset(
            AppImagePath.addImageIcon,color: AppColor.whiteColor,
            height: size.height(24),
            width: size.width(24),).paddingOnly(right: 15)
        ],
      ),
      body: GetBuilder(
          init: Get.find<AddAssetsController>(),
          builder: (controller) {
            return Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropDownButtonCommon(
                      value: controller.selectedSubCategoryController,
                      dropDownItems: controller.subCategoryDropDownItems,
                      onChanged: (value) {
                        controller.selectedSubCategoryController = value ?? "";
                        controller.update();
                      },
                    ),
                    size.heightSpace(15),
                    Row(
                      children: [
                        Flexible(
                          child: CustomTextField(
                            controller: controller.assetNameTextController,
                            fillColor: AppColor.greyColor.withOpacity(0.1),
                            isUnderLineBorderRadius: BorderRadius.circular(100),
                            isShadow: false,
                            hintText: "Asset Name",
                            underLineFocusColor: AppColor.primaryColor,
                          ),
                        ),
                        size.widthSpace(15),
                        Flexible(
                          child: CustomTextField(
                            controller: controller.assetIdTextController,
                            fillColor: AppColor.greyColor.withOpacity(0.1),
                            isUnderLineBorderRadius: BorderRadius.circular(100),
                            isShadow: false,
                            hintText: "Asset id",
                            underLineFocusColor: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    size.heightSpace(15),
                    CustomTextField(
                      controller: controller.assetQuantityTextController,
                      fillColor: AppColor.greyColor.withOpacity(0.1),
                      isUnderLineBorderRadius: BorderRadius.circular(100),
                      isShadow: false,
                      hintText: "Number of",
                      underLineFocusColor: AppColor.primaryColor,
                    ),
                    size.heightSpace(15),
                    CustomTextField(
                      controller: controller.assetDescriptionTextController,
                      fillColor: AppColor.greyColor.withOpacity(0.1),
                      isUnderLineBorderRadius: BorderRadius.circular(18),
                      isShadow: false,
                      hintText: "Asset Description",
                      isExpand: true,
                      height: size.height(120),
                      underLineFocusColor: AppColor.primaryColor,
                    ),
                    size.heightSpace(15),
                    Row(
                      children: [
                        Text("Is Asset solely owned ?",style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center,),
                        size.widthSpace(15),
                        Flexible(
                          child: DropDownButtonCommon(
                            value: controller.isSolelyOwned,
                            dropDownItems: controller.solelyOwnedList,
                            onChanged: (value) {
                              controller.isSolelyOwned = value ?? "";
                              controller.update();
                            },
                          ),
                        ),
                      ],
                    ),
                    size.heightSpace(15),
                    CustomTextField(
                      controller: controller.assetOwnedTextController,
                      fillColor: AppColor.greyColor.withOpacity(0.1),
                      isUnderLineBorderRadius: BorderRadius.circular(100),
                      isShadow: false,
                      hintText: "% Owned",
                      underLineFocusColor: AppColor.primaryColor,
                    ),
                    size.heightSpace(15),
                    HomeExpansionTile(
                      tileController: controller.partnerExpansionTileController,
                      isShadow: false,
                      title: controller.title,
                      tileMargin: 0,
                      initialExpand: false,
                      onExpansionChange: (p0) {
                        printData("onExpansionChange------${p0}");
                        controller.isExpanseChange = p0;
                        controller.update();
                      },
                      outerBorderRadius: controller.isExpanseChange ? BorderRadius.circular(20) : BorderRadius.circular(100),
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextField(
                                controller: controller.partnerNameTextController,
                                fillColor: AppColor.whiteColor,
                                isUnderLineBorderRadius: BorderRadius.circular(100),
                                isShadow: false,
                                hintText: "Name",
                                underLineFocusColor: AppColor.secondPrimaryColor,
                              ),
                            ),
                            size.widthSpace(15),
                            Flexible(
                              child: CustomTextField(
                                controller: controller.partnerOwnedTextController,
                                fillColor: AppColor.whiteColor,
                                isUnderLineBorderRadius: BorderRadius.circular(100),
                                isShadow: false,
                                hintText: "% Owned",
                                underLineFocusColor: AppColor.secondPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        size.heightSpace(15),
                        CustomTextField(
                          controller: controller.partnerPhoneTextController,
                          fillColor: AppColor.whiteColor,
                          isUnderLineBorderRadius: BorderRadius.circular(100),
                          isShadow: false,
                          hintText: "Phone Number",
                          underLineFocusColor: AppColor.secondPrimaryColor,
                        ),
                        size.heightSpace(15),
                      ],
                    ),
                    size.heightSpace(15),
                    GestureDetector(
                      onTap: (){

                      },
                      child: DottedBorder(
                        color: AppColor.secondPrimaryColor,
                        borderPadding: EdgeInsets.zero,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 2,
                        stackFit: StackFit.loose,
                        dashPattern: const [3, 5],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(100),
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            "+ Add Partners",
                            style: AppTextStyle.regularSubTitleText.copyWith(color: AppColor.secondPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                    size.heightSpace(15),
                    AppButton(
                        buttonText: "Save",
                        onPressed: (){
                          Get.find<BottomNavigationBarController>().selectedIndex = 0;
                          Get.find<BottomNavigationBarController>().update();
                          Get.offAll(() => const BottomNavigationBarScreen());
                        },
                        isBorder: false
                    ),
                  ],
                ).paddingAll(23),
              ),
            );
          }
      ),
    );
  }
}
