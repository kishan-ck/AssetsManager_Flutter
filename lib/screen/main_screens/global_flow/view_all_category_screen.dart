import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/global_controller.dart';
import 'package:assetsmanagement/models/global/home_data_model.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllCategoryScreen extends StatelessWidget {
  final Category? categoryData;
  const ViewAllCategoryScreen({super.key, this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
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
                    "back".tr,
                    style: AppTextStyle.regularText,
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(left: 15),
        centerTitle: true,
        title: const Text("Land Category"),
        titleTextStyle:
            AppTextStyle.appbarTitleText.copyWith(color: AppColor.blackColor),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
        actions: [
          Image.asset(
            AppImagePath.landIcon,
            color: AppColor.blackColor,
            height: size.height(24),
            width: size.width(24),
          ).paddingOnly(right: 25)
        ],
      ),
      body: GetBuilder(
          init: Get.find<GlobalController>(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller.searchSubCategoryTextController,
                  fillColor: AppColor.greyColor.withOpacity(0.1),
                  isUnderLineBorderRadius: BorderRadius.circular(100),
                  isShadow: false,
                  hintText: "search_here...".tr,
                  underLineFocusColor: AppColor.primaryColor,
                  suffixIcn: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppImagePath.searchIcon,
                        height: size.height(24)),
                  ),
                ),
                size.heightSpace(5),
                Text(
                  "10 Search results found",
                  style: AppTextStyle.regularText.copyWith(
                      fontSize: size.height(11), color: AppColor.greyColor),
                ),
                size.heightSpace(15),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: categoryData?.subcategory?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: size.height(106),
                        mainAxisSpacing: size.height(26),
                        crossAxisSpacing: size.width(19)),
                    padding: const EdgeInsets.only(bottom: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.categoryDataColor[index],
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.blackColor.withOpacity(0.1),
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  offset: const Offset(1, 2))
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          categoryData?.subcategory?[index].name ?? "",
                          style: AppTextStyle.regularText
                              .copyWith(color: AppColor.whiteColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).paddingAll(23);
          }),
    );
  }
}
