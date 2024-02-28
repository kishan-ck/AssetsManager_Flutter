import 'package:assetsmanagement/app_widgets/custom_network_image.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/global_controller.dart';
import 'package:assetsmanagement/screen/main_screens/add_asset_flow/assets_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({super.key});

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Get.find<AddAssetsController>().startAnimation = true;
      });
    });

    // Future.delayed(const Duration(milliseconds: 500), (){
    //   Get.find<AddAssetsController>().startAnimation = true;
    //   Get.find<AddAssetsController>().update();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: GetBuilder(
          init: Get.find<AddAssetsController>(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                size.heightSpace(35),
                Text(
                  "select_category".tr,
                  style: AppTextStyle.regularHeadingText.copyWith(fontSize: 30),
                ),
                Text(
                  "you_can_select_any_category_in_which_you_are_interested".tr,
                  style: AppTextStyle.regularSubTitleText,
                  textAlign: TextAlign.center,
                ),
                size.heightSpace(20),
                Get.find<GlobalController>().homeDataModel?.data?.category ==
                        null
                    ? const SizedBox()
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: Get.find<GlobalController>()
                                .homeDataModel
                                ?.data
                                ?.category
                                ?.length ??
                            0,
                        padding: const EdgeInsets.only(bottom: 20),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: size.height(20),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              controller.path?.clear();
                              controller.subCatId = Get.find<GlobalController>()
                                      .homeDataModel!
                                      .data!
                                      .category![index]
                                      .subcategory!
                                      .isNotEmpty
                                  ? Get.find<GlobalController>()
                                          .homeDataModel!
                                          .data!
                                          .category![index]
                                          .subcategory
                                          ?.first
                                          .id ??
                                      ""
                                  : "";
                              controller.measurementId =
                                  Get.find<GlobalController>()
                                          .homeDataModel!
                                          .data!
                                          .category![index]
                                          .measurement!
                                          .isNotEmpty
                                      ? Get.find<GlobalController>()
                                              .homeDataModel!
                                              .data!
                                              .category![index]
                                              .measurement
                                              ?.first
                                              .id ??
                                          ""
                                      : "";
                              controller.assetNameTextController.clear();
                              controller.assetDescriptionTextController.clear();
                              controller.assetIdTextController.clear();
                              controller.assetQuantityTextController.clear();
                              controller.assetOwnedTextController.clear();
                              controller.assetLocationTextController.clear();
                              controller.uploadedImageString.clear();
                              controller.partnerList.clear();
                              controller.partnerNameTextController.clear();
                              controller.partnerPhoneTextController.clear();
                              controller.partnerOwnedTextController.clear();
                              controller.update();
                              controller.selectedSubCategoryController =
                                  Get.find<GlobalController>()
                                          .homeDataModel!
                                          .data!
                                          .category![index]
                                          .subcategory!
                                          .isNotEmpty
                                      ? Get.find<GlobalController>()
                                              .homeDataModel!
                                              .data!
                                              .category![index]
                                              .subcategory
                                              ?.first
                                              .name ??
                                          ""
                                      : "";
                              Get.to(() => AssetFormScreen(
                                  category: Get.find<GlobalController>()
                                      .homeDataModel!
                                      .data!
                                      .category![index]));
                            },
                            child: AnimatedContainer(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColor.blackColor
                                            .withOpacity(0.1),
                                        blurRadius: 12,
                                        spreadRadius: 0,
                                        offset: const Offset(1, 2))
                                  ],
                                  image: Get.find<GlobalController>()
                                              .homeDataModel!
                                              .data
                                              ?.category?[index]
                                              .icon ==
                                          ""
                                      ? const DecorationImage(
                                          image: AssetImage(
                                              AppImagePath.defaultBG),
                                          alignment: Alignment.centerRight)
                                      : DecorationImage(
                                          image: NetworkImage(
                                            Get.find<GlobalController>()
                                                    .homeDataModel!
                                                    .data
                                                    ?.category?[index]
                                                    .icon ??
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR293gopaA9vQVSvmyN9ASloRaiVjn0eCKaxg&usqp=CAU",
                                          ),
                                          alignment: Alignment.centerRight)),
                              curve: Curves.easeInOut,
                              transform: Matrix4.translationValues(
                                  controller.startAnimation ? 0 : Get.width,
                                  0,
                                  0),
                              duration:
                                  Duration(milliseconds: 300 + (index * 200)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CustomNetworkImage(
                                      image: Get.find<GlobalController>()
                                              .homeDataModel!
                                              .data
                                              ?.category?[index]
                                              .image ??
                                          "",
                                      height: size.height(40),
                                      width: size.width(40),
                                    ),
                                  ),
                                  size.widthSpace(20),
                                  Text(
                                    Get.find<GlobalController>()
                                            .homeDataModel!
                                            .data
                                            ?.category?[index]
                                            .name ??
                                        "",
                                    style: AppTextStyle.largeText
                                        .copyWith(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ).paddingAll(23);
          }),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({
    required this.index,
    required this.controller,
    super.key,
  });
  int index;
  AddAssetsController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
                color: AppColor.blackColor.withOpacity(0.1),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(1, 2))
          ],
          image: DecorationImage(
              image: AssetImage(controller.categoryData[index]["bg"]),
              alignment: Alignment.centerRight)),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(
          controller.startAnimation ? 0 : Get.width, 0, 0),
      duration: Duration(milliseconds: 300 + (index * 200)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(controller.categoryData[index]["icon"],
              height: size.height(40)),
          size.widthSpace(20),
          Text(
            controller.categoryData[index]["type"] ?? "",
            style: AppTextStyle.largeText.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
