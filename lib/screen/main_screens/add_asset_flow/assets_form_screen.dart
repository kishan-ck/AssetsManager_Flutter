import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/models/global/home_data_model.dart';
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
                                          SizedBox(
                                            height: size.height(60),
                                            width: size.width(60),
                                            child: Image.file(
                                              controller.path![index],
                                              height: size.height(60),
                                              width: size.width(60),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.path!.removeAt(index);
                                              controller.update();
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: AppColor.blackColor,
                                                  shape: BoxShape.circle),
                                              alignment: Alignment.center,
                                              height: size.height(20),
                                              width: size.width(20),
                                              child: const Icon(
                                                Icons.close,
                                                color: AppColor.whiteColor,
                                                size: 20,
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

                          ///----------
                          category == null ||
                                  category?.subcategory == null ||
                                  category!.subcategory!.isEmpty
                              ? const SizedBox()
                              : DropDownButtonCommon(
                                  value:
                                      controller.selectedSubCategoryController,
                                  dropDownItems: category?.subcategory ?? [],
                                  onChanged: (value) {
                                    controller.selectedSubCategoryController =
                                        value?.name ?? "";
                                    controller.subCatId = value?.id ?? "";
                                    printData(
                                        "controller.selectedSubCategoryController-------${controller.selectedSubCategoryController}");
                                    controller.update();
                                  },
                                ),
                          size.heightSpace(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  height:
                                      controller.isValidateAssetName ? 50 : 75,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      controller.isValidateAssetName = false;
                                      controller.update();
                                      return "AssetName require";
                                    }
                                    controller.isValidateAssetName = true;
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
                                  height:
                                      controller.isValidateAssetId ? 50 : 75,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      controller.isValidateAssetId = false;
                                      controller.update();
                                      return "Assets Id require";
                                    }
                                    controller.isValidateAssetId = true;
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
                          size.heightSpace(15),
                          CustomTextField(
                            controller: controller.pricePerUnitTextController,
                            fillColor: AppColor.greyColor.withOpacity(0.1),
                            isUnderLineBorderRadius: BorderRadius.circular(100),
                            isShadow: false,
                            height: 50,
                            hintText: "price_per_unit".tr,
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
                                        height: controller.isValidate ? 50 : 75,
                                        fillColor:
                                            AppColor.greyColor.withOpacity(0.1),
                                        isUnderLineBorderRadius:
                                            BorderRadius.circular(100),
                                        textInputType: TextInputType.number,
                                        isShadow: false,
                                        hintText: "number_of".tr,
                                        validator: (value) {
                                          if (value.trim().isEmpty) {
                                            controller.isValidate = false;
                                            return "Numbers require";
                                          }
                                          controller.isValidate = true;
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
                            height:
                                controller.isValidateDescription ? 120 : 150,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                controller.isValidateDescription = false;
                                return "Numbers require";
                              }
                              controller.isValidateDescription = true;
                              return null;
                            },
                            isExpand: true,
                            // height: size.height(120),
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
                                    controller.isSolelyOwned == "Yes"
                                        ? controller.assetOwnedTextController
                                            .text = "100"
                                        : controller
                                            .assetOwnedTextController.text = "";
                                    controller.isSolelyOwned == "Yes"
                                        ? controller.readOnly = true
                                        : controller.readOnly = false;
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
                            readOnly: controller.readOnly,
                            isUnderLineBorderRadius: BorderRadius.circular(100),
                            textInputType: TextInputType.number,
                            isShadow: false,
                            hintText: "%_owned".tr,
                            underLineFocusColor: AppColor.primaryColor,
                          ),
                          size.heightSpace(15),
                          controller.isSolelyOwned == "Yes"
                              ? const SizedBox()
                              : HomeExpansionTile(
                                  tileController:
                                      controller.partnerExpansionTileController,
                                  isShadow: false,
                                  title: controller.title,
                                  tileMargin: 0,
                                  initialExpand: false,
                                  onExpansionChange: (p0) {
                                    printData("onExpansionChange------$p0");
                                    controller.isExpanseChange = p0;
                                    controller.update();
                                  },
                                  outerBorderRadius: controller.isExpanseChange
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(100),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            textInputType: TextInputType.number,
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
                                      height: controller.isValidatePartnerPhone
                                          ? 50
                                          : 75,
                                      validator: (value) {
                                        if (value.toString().trim().isEmpty) {
                                          return "Partner Phone is required";
                                        }
                                        return null;
                                      },
                                      underLineFocusColor:
                                          AppColor.secondPrimaryColor,
                                    ),
                                    size.heightSpace(15),
                                  ],
                                ),
                          controller.isSolelyOwned == "Yes"
                              ? const SizedBox()
                              : size.heightSpace(15),
                          ListView.separated(
                            itemCount: controller.partnerList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  HomeExpansionTile(
                                    tileController: controller
                                        .partnerList[index]
                                        .nameExpansionTileController,
                                    isShadow: false,
                                    title: "Partner - ${index + 2}",
                                    tileMargin: 0,
                                    initialExpand: false,
                                    onExpansionChange: (p0) {
                                      printData("onExpansionChange------${p0}");
                                      controller.partnerList[index]
                                          .isExpanseChange = p0;
                                      controller.update();
                                    },
                                    outerBorderRadius: controller
                                            .partnerList[index].isExpanseChange
                                        ? BorderRadius.circular(20)
                                        : BorderRadius.circular(100),
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: CustomTextField(
                                              controller: controller
                                                  .partnerList[index]
                                                  .nameController,
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
                                                  .partnerList[index]
                                                  .ownController,
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
                                        controller: controller
                                            .partnerList[index].phoneController,
                                        fillColor: AppColor.whiteColor,
                                        isUnderLineBorderRadius:
                                            BorderRadius.circular(100),
                                        isShadow: false,
                                        hintText: "phone_no".tr,
                                        height: controller.partnerList[index]
                                                .isPhoneValidate
                                            ? 50
                                            : 75,
                                        validator: (value) {
                                          if (value.toString().trim().isEmpty) {
                                            return "Partner Phone is required";
                                          }
                                          return null;
                                        },
                                        underLineFocusColor:
                                            AppColor.secondPrimaryColor,
                                      ),
                                      size.heightSpace(15),
                                    ],
                                  ),
                                  Positioned(
                                    right: 50,
                                    top: 15,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.partnerList.removeAt(index);
                                        controller.update();
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: AppColor.redColor,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return size.heightSpace(15);
                            },
                          ),
                          size.heightSpace(15),
                          controller.isSolelyOwned == "Yes"
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    controller.partnerList.add(PartnerModel());
                                    controller.update();
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
