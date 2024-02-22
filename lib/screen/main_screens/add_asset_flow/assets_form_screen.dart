import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/models/global/home_data_model.dart';
import 'package:assetsmanagement/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:assetsmanagement/utils/widgets/app_loader.dart';
import 'package:assetsmanagement/utils/widgets/common_dropdown_button.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:assetsmanagement/utils/widgets/home_expansiontile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetFormScreen extends StatelessWidget {
  final Category? category;

  const AssetFormScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<AddAssetsController>(),
        builder: (controller) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: AppColor.primaryColor,
                appBar: AppBar(
                  backgroundColor: AppColor.primaryColor,
                  leading: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SizedBox(
                            height: size.height(24),
                            width: size.width(24),
                            child: Icon(
                              Icons.arrow_back,
                              size: size.height(24),
                              color: AppColor.whiteColor,
                            )),
                      ),
                    ],
                  ).paddingOnly(left: 15),
                  centerTitle: true,
                  title: Text(category?.name ?? ""),
                  titleTextStyle: AppTextStyle.appbarTitleText
                      .copyWith(color: AppColor.whiteColor),
                  leadingWidth: 100,
                  automaticallyImplyLeading: false,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        controller.openFileExplorer();
                      },
                      child: Image.asset(
                        AppImagePath.addImageIcon,
                        color: AppColor.whiteColor,
                        height: size.height(24),
                        width: size.width(24),
                      ).paddingOnly(right: 15),
                    ),
                  ],
                ),
                body: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          controller.path == null || controller.path!.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  height: size.height(60),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: controller.path!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            height: size.height(60),
                                            width: size.width(60),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.file(
                                                  controller.path![index],
                                                  height: size.height(60),
                                                  width: size.width(60),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.path!.removeAt(index);
                                              controller.update();
                                            },
                                            child: SizedBox(
                                              height: size.height(20),
                                              width: size.width(20),
                                              child: const Icon(
                                                Icons.close,
                                                size: 25,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return size.widthSpace(10);
                                    },
                                  ),
                                ),
                          controller.path == null || controller.path!.isEmpty
                              ? const SizedBox()
                              : size.heightSpace(20),
                          category?.subcategory == null ||
                                  category == null ||
                                  category!.subcategory!.isEmpty
                              ? const SizedBox()
                              : DropDownButtonCommon(
                                  value:
                                      category?.subcategory?.first.name ?? "",
                                  dropDownItems: category?.subcategory,
                                  onChanged: (value) {
                                    controller.selectedSubCategoryController =
                                        value?.name ?? "";
                                    controller.subCatId = value?.id ?? "";
                                    controller.update();
                                  },
                                ),
                          size.heightSpace(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller:
                                      controller.assetNameTextController,
                                  fillColor:
                                      AppColor.greyColor.withOpacity(0.1),
                                  isUnderLineBorderRadius:
                                      BorderRadius.circular(100),
                                  isShadow: false,
                                  hintText: "asset_name".tr,
                                  underLineFocusColor: AppColor.primaryColor,
                                  height: controller.isValidate ? 50 : 75,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      controller.isValidate = false;
                                      controller.update();
                                      return "AssetName require";
                                    }
                                    controller.isValidate = true;
                                    controller.update();
                                    return null;
                                  },
                                ),
                              ),
                              size.widthSpace(15),
                              Expanded(
                                child: CustomTextField(
                                  controller: controller.assetIdTextController,
                                  fillColor:
                                      AppColor.greyColor.withOpacity(0.1),
                                  isUnderLineBorderRadius:
                                      BorderRadius.circular(100),
                                  isShadow: false,
                                  hintText: "asset_id".tr,
                                  height: controller.isValidate ? 50 : 75,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      controller.isValidate = false;
                                      controller.update();
                                      return "Assets Id require";
                                    }
                                    controller.isValidate = true;
                                    controller.update();
                                    return null;
                                  },
                                  underLineFocusColor: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          size.heightSpace(15),
                          CustomTextField(
                            controller: controller.assetLocationTextController,
                            fillColor: AppColor.greyColor.withOpacity(0.1),
                            isUnderLineBorderRadius: BorderRadius.circular(100),
                            isShadow: false,
                            hintText: "location".tr,
                            underLineFocusColor: AppColor.primaryColor,
                          ),
                          category?.measurement == null ||
                                  category == null ||
                                  category!.measurement!.isEmpty
                              ? const SizedBox()
                              : size.heightSpace(15),
                          category?.measurement == null ||
                                  category == null ||
                                  category!.measurement!.isEmpty
                              ? const SizedBox()
                              : Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CustomTextField(
                                        controller: controller
                                            .assetQuantityTextController,
                                        height: 50,
                                        fillColor:
                                            AppColor.greyColor.withOpacity(0.1),
                                        isUnderLineBorderRadius:
                                            BorderRadius.circular(100),
                                        isShadow: false,
                                        hintText: "number_of".tr,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Numbers require";
                                          }
                                          return null;
                                        },
                                        underLineFocusColor:
                                            AppColor.primaryColor,
                                      ),
                                    ),
                                    size.widthSpace(10),
                                    category?.measurement == null ||
                                            category == null ||
                                            category!.measurement!.isEmpty
                                        ? const SizedBox()
                                        : Expanded(
                                            flex: 1,
                                            child:
                                                DropDownButtonMeasurementCommon(
                                              isExpanded: true,
                                              value: category?.measurement
                                                      ?.first.name ??
                                                  "",
                                              dropDownItems:
                                                  category?.measurement,
                                              onChanged: (value) {
                                                controller
                                                        .selectedMeasurementController =
                                                    value?.name ?? "";
                                                controller.measurementId =
                                                    value?.id ?? "";
                                                controller.update();
                                              },
                                            ),
                                          )
                                  ],
                                ),
                          size.heightSpace(15),
                          CustomTextField(
                            controller:
                                controller.assetDescriptionTextController,
                            fillColor: AppColor.greyColor.withOpacity(0.1),
                            isUnderLineBorderRadius: BorderRadius.circular(18),
                            isShadow: false,
                            hintText: "asset_description".tr,
                            isExpand: true,
                            height: size.height(120),
                            underLineFocusColor: AppColor.primaryColor,
                          ),
                          size.heightSpace(15),
                          Row(
                            children: [
                              Text(
                                "is_asset_solely_owned_?".tr,
                                style: AppTextStyle.regularSubTitleText,
                                textAlign: TextAlign.center,
                              ),
                              size.widthSpace(15),
                              Flexible(
                                child: DropDownButtonStringCommon(
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
                            hintText: "%_owned".tr,
                            underLineFocusColor: AppColor.primaryColor,
                          ),
                          size.heightSpace(15),
                          controller.isSolelyOwned == "Yes"
                              ? SizedBox()
                              : HomeExpansionTile(
                                  tileController:
                                      controller.partnerExpansionTileController,
                                  isShadow: false,
                                  title: controller.title,
                                  tileMargin: 0,
                                  initialExpand: false,
                                  onExpansionChange: (p0) {
                                    printData("onExpansionChange------${p0}");
                                    controller.isExpanseChange = p0;
                                    controller.update();
                                  },
                                  outerBorderRadius: controller.isExpanseChange
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(100),
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: CustomTextField(
                                            controller: controller
                                                .partnerNameTextController,
                                            fillColor: AppColor.whiteColor,
                                            isUnderLineBorderRadius:
                                                BorderRadius.circular(100),
                                            isShadow: false,
                                            hintText: "name".tr,
                                            underLineFocusColor:
                                                AppColor.secondPrimaryColor,
                                          ),
                                        ),
                                        size.widthSpace(15),
                                        Flexible(
                                          child: CustomTextField(
                                            controller: controller
                                                .partnerOwnedTextController,
                                            fillColor: AppColor.whiteColor,
                                            isUnderLineBorderRadius:
                                                BorderRadius.circular(100),
                                            isShadow: false,
                                            hintText: "%_owned".tr,
                                            underLineFocusColor:
                                                AppColor.secondPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    size.heightSpace(15),
                                    CustomTextField(
                                      controller:
                                          controller.partnerPhoneTextController,
                                      fillColor: AppColor.whiteColor,
                                      isUnderLineBorderRadius:
                                          BorderRadius.circular(100),
                                      isShadow: false,
                                      hintText: "phone_no".tr,
                                      underLineFocusColor:
                                          AppColor.secondPrimaryColor,
                                    ),
                                    size.heightSpace(15),
                                  ],
                                ),
                          controller.isSolelyOwned == "Yes"
                              ? SizedBox()
                              : size.heightSpace(15),
                          controller.isSolelyOwned == "Yes"
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {},
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
                                        "add_partners".tr,
                                        style: AppTextStyle.regularSubTitleText
                                            .copyWith(
                                                color: AppColor
                                                    .secondPrimaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                          size.heightSpace(15),
                          AppButton(
                              buttonText: "save".tr,
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  await controller.addAssets();
                                  Get.find<BottomNavigationBarController>()
                                      .selectedIndex = 0;
                                  Get.find<BottomNavigationBarController>()
                                      .update();
                                  Get.offAll(
                                      () => const BottomNavigationBarScreen());
                                } else if (controller
                                    .selectedSubCategoryController.isEmpty) {
                                  commonSnackBar(
                                      message: "Please add category");
                                }
                              },
                              isBorder: false),
                        ],
                      ),
                    ),
                  ).paddingAll(23),
                ),
              ),
              controller.isLoading ? appLoader() : const SizedBox()
            ],
          );
        });
  }
}
