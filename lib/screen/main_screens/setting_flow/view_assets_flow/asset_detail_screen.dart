import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/user_controller.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:assetsmanagement/utils/widgets/home_expansiontile.dart';
import 'package:assetsmanagement/utils/widgets/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetDetailScreen extends StatelessWidget {
  const AssetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<UserController>(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            surfaceTintColor: AppColor.transparentColor,
            backgroundColor: AppColor.transparentColor,
            leading: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          height: size.height(24),
                          width: size.width(24),
                          child: Icon(Icons.arrow_back,size: size.height(24),color: AppColor.blackColor,)),
                      Text("back".tr,style: AppTextStyle.regularText,),
                    ],
                  ),
                ),
              ],
            ).paddingOnly(left: 15),
            centerTitle: true,
            title: Text("asset_detail".tr),
            titleTextStyle: AppTextStyle.appbarTitleText.copyWith(color: AppColor.blackColor),
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 25),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImagePath.landIcon,color: AppColor.whiteColor,
                  height: size.height(24),
                  width: size.width(24),),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => FullScreenImage(imageUrls: controller.imageUrls));
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius:
                          BorderRadius.circular(10),
                          child: Image.asset(
                            controller.imageUrls[0],
                            fit: BoxFit.cover,
                            height: size.height(175),
                            width: double.infinity,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 2,
                                  horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                  color:
                                  AppColor.lightGreenColor),
                              child: const Text(
                                'Land',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor
                                        .whiteColor,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                size.heightSpace(10),
                SizedBox(
                  height: size.height(87),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return size.widthSpace(10);
                    },
                    itemCount: controller.imageUrls.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List<String> firstThreeElements = controller.imageUrls.sublist(3, controller.imageUrls.length);
                      int imageCount = firstThreeElements.length;
                      return GestureDetector(
                        onTap : () {
                          Get.to(() => FullScreenImage(imageUrls: controller.imageUrls));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                controller.imageUrls[index],
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width / 3.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                            index == 2 ?
                            Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                  color: AppColor.blackColor.withOpacity(0.50),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Text(
                                  "+$imageCount",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: size.height(24),
                                      color: AppColor.whiteColor
                                  ),),
                              ),
                            ) :
                            const SizedBox()
                          ],
                        ),
                      );
                    },
                  ),
                ),
                size.heightSpace(15),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [AppColor.primaryColor, AppColor.secondPrimaryColor]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.secondPrimaryColor.withOpacity(0.1),
                            blurRadius: 12,
                            spreadRadius: 0,
                            offset: const Offset(3, 5))
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "purchased".tr.tr,
                                style: AppTextStyle.largeText.copyWith(color: AppColor.whiteColor),
                              ),
                              Text(
                                "50",
                                style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: size.height(50),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "current_market".tr,
                                    style: AppTextStyle.largeText.copyWith(color: AppColor.whiteColor),
                                  ),
                                  size.widthSpace(7.5),
                                  Image.asset(
                                    AppImagePath.growthIcon,color: AppColor.whiteColor,
                                    height: size.height(15),
                                    width: size.width(15),)
                                ],
                              ),
                              Text(
                                "100",
                                style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: size.height(50),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: size.height(5), horizontal: size.width(15)),
                          decoration: BoxDecoration(
                              color: AppColor.blackColor,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text(
                            "analyse".tr,
                            style: AppTextStyle.largeText.copyWith(color: AppColor.whiteColor, fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                size.heightSpace(15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: size.height(5), horizontal: size.width(15)),
                      decoration: BoxDecoration(
                          color: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        "• Co-Owned",
                        style: AppTextStyle.largeText.copyWith(color: AppColor.lightGreenColor, fontWeight: FontWeight.w700,fontSize: 10),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppImagePath.editIcon,height: size.height(23)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "name:".tr,
                          style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "location:".tr,
                          style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "category:".tr,
                          style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "sub_category:".tr,
                          style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "quantity:".tr,
                          style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "description:".tr,
                          style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    size.widthSpace(20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Home",
                            style: AppTextStyle.largeText,
                          ),
                          Row(
                            children: [
                              Image.asset(AppImagePath.locationIcon, color: AppColor.blackColor,scale: 4),
                              size.widthSpace(5),
                              Text(
                                "Adajan, Surat",
                                style: AppTextStyle.largeText,
                              ),
                            ],
                          ),
                          Text(
                            "Land",
                            style: AppTextStyle.largeText,
                          ),
                          Text(
                            "Commercial Land",
                            style: AppTextStyle.largeText,
                          ),
                          Text(
                            "500 acre",
                            style: AppTextStyle.largeText,
                          ),
                          Text(
                            "My personal land for new project.",
                            style: AppTextStyle.largeText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                size.heightSpace(15),
                HomeExpansionTile(
                  tileController: controller.mainPartnerExpansionTileController,
                  isShadow: controller.isExpanseChange ? true : false,
                  childrenPadding: const EdgeInsets.only(bottom: 10),
                  title: controller.title,
                  mainBGColor: AppColor.whiteColor,
                  subBGColor: AppColor.whiteColor,
                  bGColor: AppColor.whiteColor,
                  dropDownIconColor: AppColor.primaryColor,
                  outerBorderColor: controller.isExpanseChange ? AppColor.whiteColor.withOpacity(0.50) : AppColor.greyColor.withOpacity(0.50),
                  titleTextStyle: AppTextStyle.regularText.copyWith(fontWeight: FontWeight.bold),
                  tileMargin: 0,
                  initialExpand: false,
                  onExpansionChange: (p0) {
                    printData("onExpansionChange------$p0");
                    controller.isExpanseChange = p0;
                    controller.update();
                  },
                  outerBorderRadius: BorderRadius.circular(10),
                  children: [
                    HomeExpansionTile(
                      tileController: controller.myPartnerExpansionTileController,
                      isShadow: false,
                      title: controller.subTitle,
                      tileMargin: 0,
                      initialExpand: false,
                      onExpansionChange: (p0) {
                        printData("onExpansionChange------$p0");
                        controller.isSubExpanseChange = p0;
                        controller.update();
                      },
                      outerBorderRadius: controller.isSubExpanseChange ? BorderRadius.circular(20) : BorderRadius.circular(100),
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextField(
                                controller: controller.myPartnerNameTextController,
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
                                controller: controller.myPartnerOwnedTextController,
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
                          controller: controller.myPartnerPhoneTextController,
                          fillColor: AppColor.whiteColor,
                          isUnderLineBorderRadius: BorderRadius.circular(100),
                          isShadow: false,
                          hintText: "Phone Number",
                          underLineFocusColor: AppColor.secondPrimaryColor,
                        ),
                        size.heightSpace(15),
                      ],
                    ),
                  ],
                ),

              ],
            ).paddingAll(20),
          ),
        );
      }
    );
  }
}
