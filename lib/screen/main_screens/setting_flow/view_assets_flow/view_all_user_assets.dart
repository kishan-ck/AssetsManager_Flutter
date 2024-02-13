import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/controller/user_controller.dart';
import 'package:assetsmanagement/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:assetsmanagement/screen/main_screens/setting_flow/view_assets_flow/asset_detail_screen.dart';
import 'package:assetsmanagement/utils/widgets/common_dropdown_button.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:assetsmanagement/utils/widgets/home_expansiontile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllUserAssetsScreen extends StatelessWidget {
  const ViewAllUserAssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  Text("Back",style: AppTextStyle.regularText,),
                ],
              ),
            ),
          ],
        ).paddingOnly(left: 15),
        centerTitle: true,
        title: const Text("My Assets"),
        titleTextStyle: AppTextStyle.appbarTitleText.copyWith(color: AppColor.blackColor),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder(
          init: Get.find<UserController>(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller.searchUserAssetsTextController,
                  fillColor: AppColor.greyColor.withOpacity(0.1),
                  isUnderLineBorderRadius: BorderRadius.circular(100),
                  isShadow: false,
                  hintText: "Search here...",
                  underLineFocusColor: AppColor.primaryColor,
                  suffixIcn: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppImagePath.searchIcon,height: size.height(24)),
                  ),

                ),
                size.heightSpace(5),
                Text("10 Search results found",style: AppTextStyle.regularText.copyWith(fontSize: size.height(11), color: AppColor.greyColor),),
                size.heightSpace(15),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.userCategoryData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: size.height(126), mainAxisSpacing: size.height(26), crossAxisSpacing: size.width(19)),
                    padding: const EdgeInsets.only(bottom: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=> const AssetDetailScreen());
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage(AppImagePath.myAssetBgImage),scale: 3,alignment: Alignment.topRight),
                                  borderRadius: BorderRadius.circular(10),
                                  color:controller.userCategoryData[index]['color'],
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColor.blackColor.withOpacity(0.1),
                                        blurRadius: 12,
                                        spreadRadius: 0,
                                        offset: const Offset(1, 2))
                                  ]),
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${controller.userCategoryData[index]['type']}',style: AppTextStyle.regularText.copyWith(color:  AppColor.whiteColor),),
                                  Text('${controller.userCategoryData[index]['Quantity']}',style: AppTextStyle.regularText.copyWith(color:  AppColor.whiteColor,fontSize: 18,fontWeight: FontWeight.bold),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(AppImagePath.locationIcon, color: AppColor.whiteColor,height: size.height(10),width: size.width(10),),
                                      Text(controller.userCategoryData[index]['location'],style: AppTextStyle.regularText.copyWith(color:  AppColor.whiteColor,fontSize: size.height(10)),),
                                    ],
                                  ),
                                  Align(alignment: Alignment.bottomRight,child: Text(controller.userCategoryData[index]['isSolelyOwned'] ? "Sole Owned" : "Co-Owned",style: AppTextStyle.regularText.copyWith(color:  AppColor.whiteColor),)),
                                ],
                              ).paddingSymmetric(horizontal: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, right: 15),
                              child: Image.asset(controller.userCategoryData[index]['icon'], color: AppColor.whiteColor,height: size.height(29),width: size.width(29),),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

              ],
            ).paddingAll(23);
          }
      ),
    );
  }
}
