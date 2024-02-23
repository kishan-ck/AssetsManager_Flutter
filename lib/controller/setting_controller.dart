import 'dart:convert';
import 'dart:io';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/asset/asset_model.dart';

class SettingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool isLoading = false;

  AssetModel? assetModel;
  File? path;


  List menuList = [
    {
      "icon": AppImagePath.notificationIcon,
      "text": "Notifications",
    },
    {
      "icon": AppImagePath.languageIcon,
      "text": "Language",
    },
    {
      "icon": AppImagePath.shieldIcon,
      "text": "Privacy",
    },
    {
      "icon": AppImagePath.infoIcon,
      "text": "About Us",
    }
  ];

  Future<void> getAssetData() async {
    isLoading = true;
    update();
    await HttpHandler.getHttpMethod(url: APIEndPoints.assetUrl)
        .then((value) async {
      if (value['error'] == null) {
        printData("getAssetData Api ==> ${value['body']}");
        assetModel = AssetModel.fromJson(json.decode(value['body']));
        isLoading = false;
        update();
      } else {
        printData("getAssetData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });
    isLoading = false;
    update();
  }

  void openFileExplorer(
      {bool isMultiSelection = false,
        FileType filePickingType = FileType.image}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: filePickingType,
      allowMultiple: false,
    );

    if (result != null) {
      print("result-----> $result");
      path = File(result.paths.first ?? "");
      Get.find<AddAssetsController>().uploadImages();
      print("PATH-----> $path");
      update();
    } else {
     printData("Image Not Select =====>");
    }
  }

  showUpdateProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(child: Text("update_profile".tr)),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.find<AddAssetsController>().openFileExplorer();
                        },
                        child: Container(
                          height: size.height(150),
                          width: size.width(150),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.whiteColor),
                          child: Get.find<AddAssetsController>().uploadedImageString.isEmpty ?
                          Image.network("${Get.find<AddAssetsController>().uploadedImageString}")
                           : const Center(
                            child: Icon(Icons.camera_alt),
                          ),
                        ),
                      ),
                    ),
                    Text("full_name".tr),
                    CustomTextField(
                      textInputType: TextInputType.number,
                      controller: nameController,
                      hintText: "full_name".tr,
                      height: isValidate ? 50 : 75,
                      // isShadow: controller.isShadow,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          isValidate = false;
                          update();
                          return 'please_enter_your_full_name'.tr;
                        } else {}
                        isValidate = true;
                        update();
                        return null;
                      },
                    ),
                    size.heightSpace(15),
                    Text('email'.tr,
                        style: AppTextStyle.regularSubTitleText,
                        textAlign: TextAlign.center),
                    CustomTextField(
                      height: isValidate ? 50 : 75,
                      // isShadow: controller.isShadow,
                      controller: emailController,
                      hintText: "enter_your_email".tr,
                      errorMaxLines: 3,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          isValidate = false;
                          update();
                          return 'please_enter_email'.tr;
                        } else if (!RegExp(emailValidationRegExp)
                            .hasMatch(value)) {
                          isValidate = false;
                          update();
                          return 'please_enter_valid_email'.tr;
                        } else {}
                        isValidate = true;
                        update();
                        return null;
                      },
                    ),
                    size.heightSpace(15),
                    Text('phone_no'.tr,
                        style: AppTextStyle.regularSubTitleText,
                        textAlign: TextAlign.center),
                    CustomTextField(
                      height: isValidate ? 50 : 75,
                      // isShadow: isShadow,
                      controller: phoneController,
                      hintText: "phone_no".tr,
                      errorMaxLines: 3,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          isValidate = false;
                          update();
                          return 'please_enter_phone_no'.tr;
                        }
                        isValidate = true;
                        update();
                        return null;
                      },
                    ),
                    size.heightSpace(15),
                    AppButton(
                        buttonText: "update_profile".tr,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {

                          }
                        },
                        isBorder: false),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
